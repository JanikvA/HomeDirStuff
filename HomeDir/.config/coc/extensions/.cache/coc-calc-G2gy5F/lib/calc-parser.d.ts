import P from 'parsimmon';
import { Decimal as DecimalLib } from 'decimal.js';
export declare type BinaryExponentOptSyms = '**';
export declare const BinaryExponentOptSyms: BinaryExponentOptSyms[];
export declare type BinaryMulOptSyms = '%' | '*' | '/';
export declare const BinaryMulOptSyms: BinaryMulOptSyms[];
export declare type BinaryAddOptSyms = '+' | '-';
export declare const BinaryAddOptSyms: BinaryAddOptSyms[];
export declare type BinaryOptSyms = BinaryExponentOptSyms | BinaryMulOptSyms | BinaryAddOptSyms;
export declare const BinaryOptSyms: ("**" | "%" | "*" | "/" | "+" | "-")[];
export declare class BinaryExponentOptClass {
    '**': never;
}
export declare type UnaryOptSyms = '+' | '-';
export declare const UnaryOptSyms: UnaryOptSyms[];
export declare type ConstSyms = 'E' | 'LN2' | 'LN10' | 'LOG2E' | 'LOG10E' | 'PI' | 'SQRT1_2' | 'SQRT2';
export declare const ConstSyms: ConstSyms[];
export declare class FuncNameClass {
    abs: number[];
    acos: number[];
    acosh: number[];
    add: number[];
    asin: number[];
    asinh: number[];
    atan: number[];
    atanh: number[];
    atan2: number[];
    cbrt: number[];
    ceil: number[];
    cos: number[];
    cosh: number[];
    div: number[];
    exp: number[];
    floor: number[];
    hypot: number[];
    ln: number[];
    log: number[];
    log2: number[];
    log10: number[];
    max: number[];
    min: number[];
    mod: number[];
    mul: number[];
    pow: number[];
    random: number[];
    round: number[];
    sign: number[];
    sin: number[];
    sinh: number[];
    sqrt: number[];
    sub: number[];
    tan: number[];
    tanh: number[];
    trunc: number[];
}
export declare const FuncNameEnum: FuncNameClass;
export declare type FuncNameSyms = keyof typeof FuncNameEnum;
export declare class BinaryOpt {
    raw: BinaryOptSyms;
    constructor(raw: BinaryOptSyms);
}
export declare abstract class Node {
    type: string;
    result: DecimalLib;
    constructor();
    registerResult(callback: () => DecimalLib): void;
}
export declare class Decimal extends Node {
    raw: string;
    constructor(raw: string);
}
export declare class Constant extends Node {
    raw: string;
    constSym: ConstSyms;
    constructor(raw: string);
}
export declare class FuncCall extends Node {
    rawFuncName: string;
    args: Node[];
    funcNameSym: FuncNameSyms;
    constructor(rawFuncName: string, args: Node[]);
}
export declare class UnaryExpr extends Node {
    operators: UnaryOptSyms[];
    value: Node;
    constructor(operators: UnaryOptSyms[], value: Node);
    readonly operator: "+" | "-";
}
export declare class BinaryExpr extends Node {
    left: Node;
    operator: BinaryOpt;
    right: Node;
    static calculate(expr: BinaryExpr): DecimalLib;
    constructor(left: Node, operator: BinaryOpt, right: Node);
}
export declare type NodeParser = P.Parser<Node>;
export declare const whitespaceP: P.Parser<string>;
export declare const leftParenthesisP: P.Parser<string>;
export declare const rightParenthesisP: P.Parser<string>;
export declare const ofStringArrayP: <T extends string = string>(...strs: string[]) => P.Parser<T>;
export declare const optionalParenthesisP: <T extends any>(parser: P.Parser<T>) => P.Parser<T>;
export declare const decimalP: P.Parser<Decimal>;
export declare const includesP: (ss: string[]) => P.Parser<string>;
export declare const constantP: P.Parser<Constant>;
export declare const funcNameP: P.Parser<string>;
export declare const funcCallP: P.Parser<FuncCall>;
export declare const atomicP: P.Parser<Decimal | Constant>;
export declare const unaryOptP: P.Parser<BinaryAddOptSyms>;
export declare const unaryExprP: P.Parser<UnaryExpr | Decimal | Constant>;
export declare const binaryOptP: P.Parser<BinaryOpt>;
export declare const binaryCalculate: <N extends Node>(left: N, ...rest: [BinaryOpt, N][]) => BinaryExpr;
export declare const binaryOptExprP: P.Parser<BinaryExpr | UnaryExpr>;
export declare type RootExpr = BinaryExpr | UnaryExpr;
export declare const exprP: P.Parser<RootExpr>;
export declare const skipEqualSignP: P.Parser<string[]>;
export declare const mainP: P.Parser<RootExpr>;
export declare const parse: (text: string) => RootExpr;
export declare const printAst: (text: string) => void;
export interface CalculateResult {
    skip: number;
    result: string;
}
export declare const calculate: (text: string) => CalculateResult;
