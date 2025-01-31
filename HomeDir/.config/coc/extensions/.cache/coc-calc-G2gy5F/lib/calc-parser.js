"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const parsimmon_1 = __importDefault(require("parsimmon"));
const decimal_js_1 = require("decimal.js");
exports.BinaryExponentOptSyms = ['**'];
exports.BinaryMulOptSyms = ['%', '*', '/'];
exports.BinaryAddOptSyms = ['+', '-'];
exports.BinaryOptSyms = [
    ...exports.BinaryExponentOptSyms,
    ...exports.BinaryMulOptSyms,
    ...exports.BinaryAddOptSyms
];
class BinaryExponentOptClass {
}
exports.BinaryExponentOptClass = BinaryExponentOptClass;
exports.UnaryOptSyms = ['+', '-'];
exports.ConstSyms = [
    'E',
    'LN2',
    'LN10',
    'LOG2E',
    'LOG10E',
    'PI',
    'SQRT1_2',
    'SQRT2'
];
class FuncNameClass {
    constructor() {
        this.abs = [1];
        this.acos = [1];
        this.acosh = [1];
        this.add = [2];
        this.asin = [1];
        this.asinh = [1];
        this.atan = [1];
        this.atanh = [1];
        this.atan2 = [2];
        this.cbrt = [1];
        this.ceil = [1];
        this.cos = [1];
        this.cosh = [1];
        this.div = [2];
        this.exp = [1];
        this.floor = [1];
        this.hypot = [1, Infinity];
        this.ln = [1];
        this.log = [1, 2];
        this.log2 = [1];
        this.log10 = [1];
        this.max = [1, Infinity];
        this.min = [1, Infinity];
        this.mod = [2];
        this.mul = [2];
        this.pow = [2];
        this.random = [0, 1];
        this.round = [1];
        this.sign = [1];
        this.sin = [1];
        this.sinh = [1];
        this.sqrt = [1];
        this.sub = [2];
        this.tan = [1];
        this.tanh = [1];
        this.trunc = [1];
    }
}
exports.FuncNameClass = FuncNameClass;
exports.FuncNameEnum = new FuncNameClass();
class BinaryOpt {
    constructor(raw) {
        this.raw = raw;
    }
}
exports.BinaryOpt = BinaryOpt;
class Node {
    constructor() {
        this.type = this.constructor.name;
    }
    registerResult(callback) {
        Object.defineProperty(this, 'result', {
            get: callback,
            enumerable: true
        });
    }
}
exports.Node = Node;
class Decimal extends Node {
    constructor(raw) {
        super();
        this.raw = raw;
        this.registerResult(() => new decimal_js_1.Decimal(this.raw));
    }
}
exports.Decimal = Decimal;
class Constant extends Node {
    constructor(raw) {
        super();
        this.raw = raw;
        if (!exports.ConstSyms.includes(this.raw)) {
            throw new Error(`Constant ${this.raw} not exists`);
        }
        this.constSym = this.raw;
        this.registerResult(() => {
            return new decimal_js_1.Decimal(Math[this.constSym]);
        });
    }
}
exports.Constant = Constant;
class FuncCall extends Node {
    constructor(rawFuncName, args) {
        super();
        this.rawFuncName = rawFuncName;
        this.args = args;
        if (!(this.rawFuncName in exports.FuncNameEnum)) {
            throw new Error(`Function ${this.rawFuncName} not exists`);
        }
        this.funcNameSym = this.rawFuncName;
        this.registerResult(() => {
            // @ts-ignore
            return decimal_js_1.Decimal[this.funcNameSym](...args.map(a => a.result));
        });
    }
}
exports.FuncCall = FuncCall;
class UnaryExpr extends Node {
    constructor(operators, value) {
        super();
        this.operators = operators;
        this.value = value;
        this.registerResult(() => this.operator === '+'
            ? new decimal_js_1.Decimal(this.value.result)
            : new decimal_js_1.Decimal(0).sub(this.value.result));
    }
    get operator() {
        return this.operators.reduce((ret, o) => ret * (o === '+' ? 1 : -1), 1) ===
            1
            ? '+'
            : '-';
    }
}
exports.UnaryExpr = UnaryExpr;
class BinaryExpr extends Node {
    constructor(left, operator, right) {
        super();
        this.left = left;
        this.operator = operator;
        this.right = right;
        this.registerResult(() => BinaryExpr.calculate(this));
    }
    static calculate(expr) {
        const l = expr.left.result;
        const r = expr.right.result;
        return {
            '+': () => l.add(r),
            '-': () => l.minus(r),
            '*': () => l.mul(r),
            '/': () => l.div(r),
            '%': () => l.modulo(r),
            '**': () => l.pow(r)
        }[expr.operator.raw]();
    }
}
exports.BinaryExpr = BinaryExpr;
exports.whitespaceP = parsimmon_1.default.optWhitespace;
const _ = exports.whitespaceP;
exports.leftParenthesisP = parsimmon_1.default.string('(').trim(_);
exports.rightParenthesisP = parsimmon_1.default.string(')').trim(_);
exports.ofStringArrayP = (...strs) => parsimmon_1.default.alt(...strs.map(s => parsimmon_1.default.string(s)));
exports.optionalParenthesisP = (parser) => {
    return parsimmon_1.default.alt(parser, parser.wrap(exports.leftParenthesisP, exports.rightParenthesisP), parsimmon_1.default.lazy(() => exports.optionalParenthesisP(parser).wrap(exports.leftParenthesisP, exports.rightParenthesisP)));
};
exports.decimalP = parsimmon_1.default.regexp(/(\d+(\.\d+)?|(\.\d+))(e[-+]?\d+)?(p[-+]?\d+)?/)
    .map(str => new Decimal(str))
    .desc('decimal');
exports.includesP = (ss) => parsimmon_1.default.alt(...ss.map(s => parsimmon_1.default.string(s)));
// export const constantP = P.regexp(/[A-Z_][A-Z_0-9]*/)
exports.constantP = exports.includesP(exports.ConstSyms)
    .map(str => new Constant(str))
    .desc('constant');
// export const funcNameP = P.regexp(/[A-Z_a-z]\w*/).desc('functionName');
exports.funcNameP = exports.includesP(Object.keys(exports.FuncNameEnum)).desc('functionName');
exports.funcCallP = parsimmon_1.default.lazy(() => parsimmon_1.default.seq(exports.funcNameP, parsimmon_1.default.sepBy(exports.exprP, parsimmon_1.default.string(',').trim(_)).wrap(exports.leftParenthesisP, exports.rightParenthesisP)).map(([name, args]) => new FuncCall(name, args))).desc('functionCall');
exports.atomicP = exports.optionalParenthesisP(parsimmon_1.default.alt(exports.funcCallP, exports.constantP, exports.decimalP)).desc('atomic');
exports.unaryOptP = exports.ofStringArrayP(...exports.UnaryOptSyms)
    .trim(_)
    .desc('unaryOperator');
exports.unaryExprP = parsimmon_1.default.lazy(() => exports.optionalParenthesisP(parsimmon_1.default.alt(parsimmon_1.default.seq(exports.unaryOptP.many(), exports.atomicP).map(([unaryOperators, decimal]) => new UnaryExpr(unaryOperators, decimal)), exports.atomicP))).desc('unaryExpression');
exports.binaryOptP = exports.ofStringArrayP(...exports.BinaryOptSyms)
    .trim(_)
    .map(str => new BinaryOpt(str))
    .desc('binaryOperator');
exports.binaryCalculate = (left, ...rest) => {
    const nodeStack = [];
    const optStack = [];
    nodeStack.unshift(left);
    const arithmeticCalc = (opts) => {
        const _nodeStack = [];
        const _optStack = [];
        while (optStack.length && opts.includes(optStack[0].raw)) {
            if (_nodeStack.length === 0)
                _nodeStack.unshift(nodeStack.shift());
            _optStack.unshift(optStack.shift());
            _nodeStack.unshift(nodeStack.shift());
        }
        if (_nodeStack.length > 0) {
            let left = _nodeStack.shift();
            while (_optStack.length > 0) {
                const op = _optStack.shift();
                const right = _nodeStack.shift();
                left = new BinaryExpr(left, op, right);
            }
            nodeStack.unshift(left);
        }
    };
    const exponentCalc = () => {
        while (optStack.length &&
            exports.BinaryExponentOptSyms.includes(optStack[0].raw)) {
            const op = optStack.shift();
            const right = nodeStack.shift();
            const left = nodeStack.shift();
            nodeStack.unshift(new BinaryExpr(left, op, right));
        }
    };
    while (rest.length > 0) {
        const [op, expr] = rest.shift();
        if (exports.BinaryExponentOptSyms.includes(op.raw)) {
            optStack.unshift(op);
            nodeStack.unshift(expr);
        }
        else if (exports.BinaryMulOptSyms.includes(op.raw)) {
            exponentCalc();
            optStack.unshift(op);
            nodeStack.unshift(expr);
        }
        else if (exports.BinaryAddOptSyms.includes(op.raw)) {
            exponentCalc();
            arithmeticCalc(exports.BinaryMulOptSyms);
            optStack.unshift(op);
            nodeStack.unshift(expr);
        }
    }
    exponentCalc();
    arithmeticCalc(exports.BinaryMulOptSyms);
    arithmeticCalc(exports.BinaryAddOptSyms);
    return nodeStack.shift();
};
exports.binaryOptExprP = parsimmon_1.default.lazy(() => {
    const unaryP = (parser) => {
        return parsimmon_1.default.alt(parsimmon_1.default.seq(exports.unaryOptP.many(), parser).map(([unaryOpts, expr]) => new UnaryExpr(unaryOpts, expr)), parser);
    };
    const exprP = exports.optionalParenthesisP(parsimmon_1.default.seqMap(parsimmon_1.default.alt(unaryP(exports.binaryOptExprP.wrap(exports.leftParenthesisP, exports.rightParenthesisP)), exports.unaryExprP), parsimmon_1.default.seq(exports.binaryOptP, parsimmon_1.default.alt(unaryP(exports.binaryOptExprP.wrap(exports.leftParenthesisP, exports.rightParenthesisP)), exports.unaryExprP)).atLeast(1), (left, [...rest]) => exports.binaryCalculate(left, ...rest)));
    return unaryP(exprP);
});
exports.exprP = parsimmon_1.default.alt(exports.binaryOptExprP, exports.unaryExprP)
    .trim(_)
    .desc('expression');
exports.skipEqualSignP = parsimmon_1.default.string('=')
    .trim(_)
    .times(0, 1);
exports.mainP = exports.exprP.skip(exports.skipEqualSignP).desc('main');
exports.parse = (text) => exports.mainP.tryParse(text);
exports.printAst = (text) => {
    const ast = exports.parse(text);
    console.log(JSON.stringify(ast, null, 2));
};
const skipEqual = (text) => {
    const lastIndex = text.lastIndexOf('=');
    return lastIndex === -1 ? 0 : lastIndex + 1;
};
const skipWord = (text) => {
    const index = text.search(/\W/);
    return index === -1 ? text.length : index + 1;
};
const calculateRecursion = (text, skipped, skippedRecords = [], originText) => {
    try {
        const ast = exports.parse(text);
        return {
            skip: skipped,
            result: ast.result.valueOf()
        };
    }
    catch (err) {
        if (err.type === 'ParsimmonError') {
            if (text.length > 0) {
                const skip = skipWord(text);
                const newSkip = skipped + skip;
                return calculateRecursion(text.slice(skip), newSkip, [...skippedRecords, newSkip], originText);
            }
        }
        const highlightSkipRecords = Array.from(Array(originText.length))
            .map((_, index) => (skippedRecords.includes(index) ? '✗' : ' '))
            .join('');
        throw new Error(['CalculateError:', originText, highlightSkipRecords].join('\r\n'));
    }
};
exports.calculate = (text) => {
    const textTrim = text.replace(/[=\s]*$/g, '');
    const skip = skipEqual(textTrim);
    return calculateRecursion(textTrim.slice(skip), skip, [], text);
};
