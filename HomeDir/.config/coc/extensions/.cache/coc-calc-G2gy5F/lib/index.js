"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const coc_nvim_1 = require("coc.nvim");
const vscode_languageserver_protocol_1 = require("vscode-languageserver-protocol");
const calc_parser_1 = require("./calc-parser");
class CalcProvider {
    constructor(isDebug) {
        this.isDebug = isDebug;
        this.matchIds = new Set();
        this.srdId = coc_nvim_1.workspace.createNameSpace('coc-calc');
        coc_nvim_1.workspace.registerKeymap(['i'], '<ESC>', () => {
            this.clearHighlight();
        });
        coc_nvim_1.workspace.registerAutocmd({
            event: 'CursorMoved',
            callback: () => {
                this.clearHighlight();
            }
        });
        coc_nvim_1.workspace.registerAutocmd({
            event: 'CursorMovedI',
            callback: () => {
                this.clearHighlight();
            }
        });
    }
    highlight(range) {
        return __awaiter(this, void 0, void 0, function* () {
            coc_nvim_1.workspace.showMessage(range.toString(), 'error');
            const document = yield coc_nvim_1.workspace.document;
            const matchIds = document.highlightRanges([range], 'CocCalcFormule', this.srdId);
            matchIds.forEach(id => this.matchIds.add(id));
        });
    }
    clearHighlight() {
        return __awaiter(this, void 0, void 0, function* () {
            const document = yield coc_nvim_1.workspace.document;
            document.clearMatchIds(this.matchIds);
        });
    }
    provideCompletionItems(document, position, _token, _context) {
        return __awaiter(this, void 0, void 0, function* () {
            const startPosition = vscode_languageserver_protocol_1.Position.create(position.line, 0);
            const expr = document.getText(vscode_languageserver_protocol_1.Range.create(startPosition, position));
            if (!expr.trimRight().endsWith('=')) {
                return [];
            }
            try {
                const { skip, result } = calc_parser_1.calculate(expr);
                const formulaRaw = expr.slice(skip);
                const leftMatches = formulaRaw.match(/^\s+/);
                const leftEmpty = leftMatches ? leftMatches[0].length : 0;
                const rightMatches = formulaRaw.match(/[\s=]+$/);
                const rightEmpty = rightMatches ? rightMatches[0].length : 0;
                const newText = expr.endsWith(' =') ? ' ' + result : result;
                this.clearHighlight();
                this.highlight(vscode_languageserver_protocol_1.Range.create(position.line, skip + leftEmpty, position.line, position.character - rightEmpty));
                return [
                    {
                        label: result,
                        kind: vscode_languageserver_protocol_1.CompletionItemKind.Constant,
                        documentation: '`' + expr.slice(skip).trimLeft() + newText + '`',
                        textEdit: {
                            range: vscode_languageserver_protocol_1.Range.create(position.line, position.character, position.line, position.character),
                            newText
                        }
                    }
                ];
            }
            catch (error) {
                if (this.isDebug) {
                    coc_nvim_1.workspace.showMessage(error.message, 'error');
                }
                return [];
            }
        });
    }
}
exports.activate = (context) => __awaiter(this, void 0, void 0, function* () {
    const { subscriptions } = context;
    const config = coc_nvim_1.workspace.getConfiguration('calc');
    if (config.get('highlight', true)) {
        coc_nvim_1.workspace.nvim.command('highlight default link CocCalcFormule CocHighlightText', true);
    }
    const disposable = coc_nvim_1.languages.registerCompletionItemProvider('calc', 'CALC', null, new CalcProvider(config.get('debug', false)), ['=', ' '], config.get('priority', 99));
    subscriptions.push(disposable);
});
