# Generated from UniAssembly.g4 by ANTLR 4.13.2
# encoding: utf-8
from antlr4 import *
from io import StringIO
import sys
if sys.version_info[1] > 5:
	from typing import TextIO
else:
	from typing.io import TextIO

def serializedATN():
    return [
        4,1,20,133,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,
        6,2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,1,0,1,0,1,0,5,0,26,8,0,10,0,
        12,0,29,9,0,1,0,1,0,1,1,1,1,1,1,3,1,36,8,1,1,2,1,2,3,2,40,8,2,1,
        3,1,3,1,3,5,3,45,8,3,10,3,12,3,48,9,3,1,3,1,3,1,3,1,3,3,3,54,8,3,
        1,4,1,4,1,4,5,4,59,8,4,10,4,12,4,62,9,4,1,4,1,4,3,4,66,8,4,1,5,1,
        5,1,5,5,5,71,8,5,10,5,12,5,74,9,5,1,6,1,6,1,6,1,6,1,6,1,6,1,6,1,
        6,1,6,1,6,1,6,1,6,1,6,1,6,1,6,1,6,1,6,1,6,1,6,1,6,1,6,1,6,1,6,1,
        6,3,6,100,8,6,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,3,7,110,8,7,1,8,1,
        8,1,8,1,8,1,8,1,8,1,9,1,9,1,9,1,9,1,10,1,10,1,10,1,10,1,10,1,10,
        1,10,1,10,1,10,3,10,131,8,10,1,10,0,0,11,0,2,4,6,8,10,12,14,16,18,
        20,0,0,143,0,22,1,0,0,0,2,35,1,0,0,0,4,37,1,0,0,0,6,53,1,0,0,0,8,
        60,1,0,0,0,10,67,1,0,0,0,12,99,1,0,0,0,14,109,1,0,0,0,16,111,1,0,
        0,0,18,117,1,0,0,0,20,130,1,0,0,0,22,27,3,2,1,0,23,24,5,19,0,0,24,
        26,3,2,1,0,25,23,1,0,0,0,26,29,1,0,0,0,27,25,1,0,0,0,27,28,1,0,0,
        0,28,30,1,0,0,0,29,27,1,0,0,0,30,31,5,0,0,1,31,1,1,0,0,0,32,36,3,
        4,2,0,33,36,3,6,3,0,34,36,3,8,4,0,35,32,1,0,0,0,35,33,1,0,0,0,35,
        34,1,0,0,0,36,3,1,0,0,0,37,39,5,2,0,0,38,40,3,10,5,0,39,38,1,0,0,
        0,39,40,1,0,0,0,40,5,1,0,0,0,41,42,5,17,0,0,42,43,5,2,0,0,43,45,
        5,18,0,0,44,41,1,0,0,0,45,48,1,0,0,0,46,44,1,0,0,0,46,47,1,0,0,0,
        47,49,1,0,0,0,48,46,1,0,0,0,49,50,5,3,0,0,50,54,5,7,0,0,51,52,5,
        2,0,0,52,54,5,7,0,0,53,46,1,0,0,0,53,51,1,0,0,0,54,7,1,0,0,0,55,
        56,5,17,0,0,56,57,5,2,0,0,57,59,5,18,0,0,58,55,1,0,0,0,59,62,1,0,
        0,0,60,58,1,0,0,0,60,61,1,0,0,0,61,63,1,0,0,0,62,60,1,0,0,0,63,65,
        5,3,0,0,64,66,3,10,5,0,65,64,1,0,0,0,65,66,1,0,0,0,66,9,1,0,0,0,
        67,72,3,20,10,0,68,69,5,8,0,0,69,71,3,20,10,0,70,68,1,0,0,0,71,74,
        1,0,0,0,72,70,1,0,0,0,72,73,1,0,0,0,73,11,1,0,0,0,74,72,1,0,0,0,
        75,76,5,5,0,0,76,77,5,9,0,0,77,78,5,1,0,0,78,100,5,10,0,0,79,80,
        5,11,0,0,80,81,5,1,0,0,81,82,5,8,0,0,82,83,3,16,8,0,83,84,5,12,0,
        0,84,100,1,0,0,0,85,86,5,11,0,0,86,87,5,1,0,0,87,100,5,12,0,0,88,
        89,5,11,0,0,89,90,5,1,0,0,90,91,5,8,0,0,91,92,5,5,0,0,92,100,5,12,
        0,0,93,94,5,11,0,0,94,95,5,1,0,0,95,96,5,8,0,0,96,97,5,5,0,0,97,
        98,5,12,0,0,98,100,5,14,0,0,99,75,1,0,0,0,99,79,1,0,0,0,99,85,1,
        0,0,0,99,88,1,0,0,0,99,93,1,0,0,0,100,13,1,0,0,0,101,102,5,7,0,0,
        102,103,5,2,0,0,103,104,5,7,0,0,104,110,5,2,0,0,105,106,5,7,0,0,
        106,107,5,2,0,0,107,108,5,7,0,0,108,110,5,3,0,0,109,101,1,0,0,0,
        109,105,1,0,0,0,110,15,1,0,0,0,111,112,5,13,0,0,112,113,5,7,0,0,
        113,114,5,2,0,0,114,115,5,7,0,0,115,116,5,2,0,0,116,17,1,0,0,0,117,
        118,5,15,0,0,118,119,5,16,0,0,119,120,5,2,0,0,120,19,1,0,0,0,121,
        131,5,1,0,0,122,131,3,12,6,0,123,131,3,14,7,0,124,131,3,18,9,0,125,
        131,5,5,0,0,126,131,5,4,0,0,127,131,5,2,0,0,128,131,5,3,0,0,129,
        131,5,6,0,0,130,121,1,0,0,0,130,122,1,0,0,0,130,123,1,0,0,0,130,
        124,1,0,0,0,130,125,1,0,0,0,130,126,1,0,0,0,130,127,1,0,0,0,130,
        128,1,0,0,0,130,129,1,0,0,0,131,21,1,0,0,0,11,27,35,39,46,53,60,
        65,72,99,109,130
    ]

class UniAssemblyParser ( Parser ):

    grammarFileName = "UniAssembly.g4"

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    sharedContextCache = PredictionContextCache()

    literalNames = [ "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                     "<INVALID>", "<INVALID>", "<INVALID>", "':'", "','", 
                     "'('", "')'", "'['", "']'", "'#'", "'!'", "'.'", "'-'", 
                     "'{'", "'}'" ]

    symbolicNames = [ "<INVALID>", "REGISTER", "SYMBOL", "DOT_SYMBOL", "IMMEDIATE", 
                      "NUMBER", "STRING", "COLON", "COMMA", "LPAREN", "RPAREN", 
                      "LBRACK", "RBRACK", "HASH", "BANG", "DOT", "MINUS", 
                      "LCURLY", "RCURLY", "NEWLINE", "WS" ]

    RULE_program = 0
    RULE_line = 1
    RULE_instruction = 2
    RULE_label = 3
    RULE_directive = 4
    RULE_operands = 5
    RULE_memory_operand = 6
    RULE_modified_symbol = 7
    RULE_relocation_expr = 8
    RULE_expression = 9
    RULE_operand = 10

    ruleNames =  [ "program", "line", "instruction", "label", "directive", 
                   "operands", "memory_operand", "modified_symbol", "relocation_expr", 
                   "expression", "operand" ]

    EOF = Token.EOF
    REGISTER=1
    SYMBOL=2
    DOT_SYMBOL=3
    IMMEDIATE=4
    NUMBER=5
    STRING=6
    COLON=7
    COMMA=8
    LPAREN=9
    RPAREN=10
    LBRACK=11
    RBRACK=12
    HASH=13
    BANG=14
    DOT=15
    MINUS=16
    LCURLY=17
    RCURLY=18
    NEWLINE=19
    WS=20

    def __init__(self, input:TokenStream, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.13.2")
        self._interp = ParserATNSimulator(self, self.atn, self.decisionsToDFA, self.sharedContextCache)
        self._predicates = None




    class ProgramContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def line(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(UniAssemblyParser.LineContext)
            else:
                return self.getTypedRuleContext(UniAssemblyParser.LineContext,i)


        def EOF(self):
            return self.getToken(UniAssemblyParser.EOF, 0)

        def NEWLINE(self, i:int=None):
            if i is None:
                return self.getTokens(UniAssemblyParser.NEWLINE)
            else:
                return self.getToken(UniAssemblyParser.NEWLINE, i)

        def getRuleIndex(self):
            return UniAssemblyParser.RULE_program

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterProgram" ):
                listener.enterProgram(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitProgram" ):
                listener.exitProgram(self)




    def program(self):

        localctx = UniAssemblyParser.ProgramContext(self, self._ctx, self.state)
        self.enterRule(localctx, 0, self.RULE_program)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 22
            self.line()
            self.state = 27
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==19:
                self.state = 23
                self.match(UniAssemblyParser.NEWLINE)
                self.state = 24
                self.line()
                self.state = 29
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 30
            self.match(UniAssemblyParser.EOF)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class LineContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def instruction(self):
            return self.getTypedRuleContext(UniAssemblyParser.InstructionContext,0)


        def label(self):
            return self.getTypedRuleContext(UniAssemblyParser.LabelContext,0)


        def directive(self):
            return self.getTypedRuleContext(UniAssemblyParser.DirectiveContext,0)


        def getRuleIndex(self):
            return UniAssemblyParser.RULE_line

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterLine" ):
                listener.enterLine(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitLine" ):
                listener.exitLine(self)




    def line(self):

        localctx = UniAssemblyParser.LineContext(self, self._ctx, self.state)
        self.enterRule(localctx, 2, self.RULE_line)
        try:
            self.state = 35
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,1,self._ctx)
            if la_ == 1:
                self.enterOuterAlt(localctx, 1)
                self.state = 32
                self.instruction()
                pass

            elif la_ == 2:
                self.enterOuterAlt(localctx, 2)
                self.state = 33
                self.label()
                pass

            elif la_ == 3:
                self.enterOuterAlt(localctx, 3)
                self.state = 34
                self.directive()
                pass


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class InstructionContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def SYMBOL(self):
            return self.getToken(UniAssemblyParser.SYMBOL, 0)

        def operands(self):
            return self.getTypedRuleContext(UniAssemblyParser.OperandsContext,0)


        def getRuleIndex(self):
            return UniAssemblyParser.RULE_instruction

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterInstruction" ):
                listener.enterInstruction(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitInstruction" ):
                listener.exitInstruction(self)




    def instruction(self):

        localctx = UniAssemblyParser.InstructionContext(self, self._ctx, self.state)
        self.enterRule(localctx, 4, self.RULE_instruction)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 37
            self.match(UniAssemblyParser.SYMBOL)
            self.state = 39
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if (((_la) & ~0x3f) == 0 and ((1 << _la) & 35070) != 0):
                self.state = 38
                self.operands()


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class LabelContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def DOT_SYMBOL(self):
            return self.getToken(UniAssemblyParser.DOT_SYMBOL, 0)

        def COLON(self):
            return self.getToken(UniAssemblyParser.COLON, 0)

        def LCURLY(self, i:int=None):
            if i is None:
                return self.getTokens(UniAssemblyParser.LCURLY)
            else:
                return self.getToken(UniAssemblyParser.LCURLY, i)

        def SYMBOL(self, i:int=None):
            if i is None:
                return self.getTokens(UniAssemblyParser.SYMBOL)
            else:
                return self.getToken(UniAssemblyParser.SYMBOL, i)

        def RCURLY(self, i:int=None):
            if i is None:
                return self.getTokens(UniAssemblyParser.RCURLY)
            else:
                return self.getToken(UniAssemblyParser.RCURLY, i)

        def getRuleIndex(self):
            return UniAssemblyParser.RULE_label

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterLabel" ):
                listener.enterLabel(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitLabel" ):
                listener.exitLabel(self)




    def label(self):

        localctx = UniAssemblyParser.LabelContext(self, self._ctx, self.state)
        self.enterRule(localctx, 6, self.RULE_label)
        self._la = 0 # Token type
        try:
            self.state = 53
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [3, 17]:
                self.enterOuterAlt(localctx, 1)
                self.state = 46
                self._errHandler.sync(self)
                _la = self._input.LA(1)
                while _la==17:
                    self.state = 41
                    self.match(UniAssemblyParser.LCURLY)
                    self.state = 42
                    self.match(UniAssemblyParser.SYMBOL)
                    self.state = 43
                    self.match(UniAssemblyParser.RCURLY)
                    self.state = 48
                    self._errHandler.sync(self)
                    _la = self._input.LA(1)

                self.state = 49
                self.match(UniAssemblyParser.DOT_SYMBOL)
                self.state = 50
                self.match(UniAssemblyParser.COLON)
                pass
            elif token in [2]:
                self.enterOuterAlt(localctx, 2)
                self.state = 51
                self.match(UniAssemblyParser.SYMBOL)
                self.state = 52
                self.match(UniAssemblyParser.COLON)
                pass
            else:
                raise NoViableAltException(self)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class DirectiveContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def DOT_SYMBOL(self):
            return self.getToken(UniAssemblyParser.DOT_SYMBOL, 0)

        def LCURLY(self, i:int=None):
            if i is None:
                return self.getTokens(UniAssemblyParser.LCURLY)
            else:
                return self.getToken(UniAssemblyParser.LCURLY, i)

        def SYMBOL(self, i:int=None):
            if i is None:
                return self.getTokens(UniAssemblyParser.SYMBOL)
            else:
                return self.getToken(UniAssemblyParser.SYMBOL, i)

        def RCURLY(self, i:int=None):
            if i is None:
                return self.getTokens(UniAssemblyParser.RCURLY)
            else:
                return self.getToken(UniAssemblyParser.RCURLY, i)

        def operands(self):
            return self.getTypedRuleContext(UniAssemblyParser.OperandsContext,0)


        def getRuleIndex(self):
            return UniAssemblyParser.RULE_directive

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterDirective" ):
                listener.enterDirective(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitDirective" ):
                listener.exitDirective(self)




    def directive(self):

        localctx = UniAssemblyParser.DirectiveContext(self, self._ctx, self.state)
        self.enterRule(localctx, 8, self.RULE_directive)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 60
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==17:
                self.state = 55
                self.match(UniAssemblyParser.LCURLY)
                self.state = 56
                self.match(UniAssemblyParser.SYMBOL)
                self.state = 57
                self.match(UniAssemblyParser.RCURLY)
                self.state = 62
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 63
            self.match(UniAssemblyParser.DOT_SYMBOL)
            self.state = 65
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if (((_la) & ~0x3f) == 0 and ((1 << _la) & 35070) != 0):
                self.state = 64
                self.operands()


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class OperandsContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def operand(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(UniAssemblyParser.OperandContext)
            else:
                return self.getTypedRuleContext(UniAssemblyParser.OperandContext,i)


        def COMMA(self, i:int=None):
            if i is None:
                return self.getTokens(UniAssemblyParser.COMMA)
            else:
                return self.getToken(UniAssemblyParser.COMMA, i)

        def getRuleIndex(self):
            return UniAssemblyParser.RULE_operands

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterOperands" ):
                listener.enterOperands(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitOperands" ):
                listener.exitOperands(self)




    def operands(self):

        localctx = UniAssemblyParser.OperandsContext(self, self._ctx, self.state)
        self.enterRule(localctx, 10, self.RULE_operands)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 67
            self.operand()
            self.state = 72
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==8:
                self.state = 68
                self.match(UniAssemblyParser.COMMA)
                self.state = 69
                self.operand()
                self.state = 74
                self._errHandler.sync(self)
                _la = self._input.LA(1)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class Memory_operandContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def NUMBER(self):
            return self.getToken(UniAssemblyParser.NUMBER, 0)

        def LPAREN(self):
            return self.getToken(UniAssemblyParser.LPAREN, 0)

        def REGISTER(self):
            return self.getToken(UniAssemblyParser.REGISTER, 0)

        def RPAREN(self):
            return self.getToken(UniAssemblyParser.RPAREN, 0)

        def LBRACK(self):
            return self.getToken(UniAssemblyParser.LBRACK, 0)

        def COMMA(self):
            return self.getToken(UniAssemblyParser.COMMA, 0)

        def relocation_expr(self):
            return self.getTypedRuleContext(UniAssemblyParser.Relocation_exprContext,0)


        def RBRACK(self):
            return self.getToken(UniAssemblyParser.RBRACK, 0)

        def BANG(self):
            return self.getToken(UniAssemblyParser.BANG, 0)

        def getRuleIndex(self):
            return UniAssemblyParser.RULE_memory_operand

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterMemory_operand" ):
                listener.enterMemory_operand(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitMemory_operand" ):
                listener.exitMemory_operand(self)




    def memory_operand(self):

        localctx = UniAssemblyParser.Memory_operandContext(self, self._ctx, self.state)
        self.enterRule(localctx, 12, self.RULE_memory_operand)
        try:
            self.state = 99
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,8,self._ctx)
            if la_ == 1:
                self.enterOuterAlt(localctx, 1)
                self.state = 75
                self.match(UniAssemblyParser.NUMBER)
                self.state = 76
                self.match(UniAssemblyParser.LPAREN)
                self.state = 77
                self.match(UniAssemblyParser.REGISTER)
                self.state = 78
                self.match(UniAssemblyParser.RPAREN)
                pass

            elif la_ == 2:
                self.enterOuterAlt(localctx, 2)
                self.state = 79
                self.match(UniAssemblyParser.LBRACK)
                self.state = 80
                self.match(UniAssemblyParser.REGISTER)
                self.state = 81
                self.match(UniAssemblyParser.COMMA)
                self.state = 82
                self.relocation_expr()
                self.state = 83
                self.match(UniAssemblyParser.RBRACK)
                pass

            elif la_ == 3:
                self.enterOuterAlt(localctx, 3)
                self.state = 85
                self.match(UniAssemblyParser.LBRACK)
                self.state = 86
                self.match(UniAssemblyParser.REGISTER)
                self.state = 87
                self.match(UniAssemblyParser.RBRACK)
                pass

            elif la_ == 4:
                self.enterOuterAlt(localctx, 4)
                self.state = 88
                self.match(UniAssemblyParser.LBRACK)
                self.state = 89
                self.match(UniAssemblyParser.REGISTER)
                self.state = 90
                self.match(UniAssemblyParser.COMMA)
                self.state = 91
                self.match(UniAssemblyParser.NUMBER)
                self.state = 92
                self.match(UniAssemblyParser.RBRACK)
                pass

            elif la_ == 5:
                self.enterOuterAlt(localctx, 5)
                self.state = 93
                self.match(UniAssemblyParser.LBRACK)
                self.state = 94
                self.match(UniAssemblyParser.REGISTER)
                self.state = 95
                self.match(UniAssemblyParser.COMMA)
                self.state = 96
                self.match(UniAssemblyParser.NUMBER)
                self.state = 97
                self.match(UniAssemblyParser.RBRACK)
                self.state = 98
                self.match(UniAssemblyParser.BANG)
                pass


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class Modified_symbolContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def COLON(self, i:int=None):
            if i is None:
                return self.getTokens(UniAssemblyParser.COLON)
            else:
                return self.getToken(UniAssemblyParser.COLON, i)

        def SYMBOL(self, i:int=None):
            if i is None:
                return self.getTokens(UniAssemblyParser.SYMBOL)
            else:
                return self.getToken(UniAssemblyParser.SYMBOL, i)

        def DOT_SYMBOL(self):
            return self.getToken(UniAssemblyParser.DOT_SYMBOL, 0)

        def getRuleIndex(self):
            return UniAssemblyParser.RULE_modified_symbol

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterModified_symbol" ):
                listener.enterModified_symbol(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitModified_symbol" ):
                listener.exitModified_symbol(self)




    def modified_symbol(self):

        localctx = UniAssemblyParser.Modified_symbolContext(self, self._ctx, self.state)
        self.enterRule(localctx, 14, self.RULE_modified_symbol)
        try:
            self.state = 109
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,9,self._ctx)
            if la_ == 1:
                self.enterOuterAlt(localctx, 1)
                self.state = 101
                self.match(UniAssemblyParser.COLON)
                self.state = 102
                self.match(UniAssemblyParser.SYMBOL)
                self.state = 103
                self.match(UniAssemblyParser.COLON)
                self.state = 104
                self.match(UniAssemblyParser.SYMBOL)
                pass

            elif la_ == 2:
                self.enterOuterAlt(localctx, 2)
                self.state = 105
                self.match(UniAssemblyParser.COLON)
                self.state = 106
                self.match(UniAssemblyParser.SYMBOL)
                self.state = 107
                self.match(UniAssemblyParser.COLON)
                self.state = 108
                self.match(UniAssemblyParser.DOT_SYMBOL)
                pass


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class Relocation_exprContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def HASH(self):
            return self.getToken(UniAssemblyParser.HASH, 0)

        def COLON(self, i:int=None):
            if i is None:
                return self.getTokens(UniAssemblyParser.COLON)
            else:
                return self.getToken(UniAssemblyParser.COLON, i)

        def SYMBOL(self, i:int=None):
            if i is None:
                return self.getTokens(UniAssemblyParser.SYMBOL)
            else:
                return self.getToken(UniAssemblyParser.SYMBOL, i)

        def getRuleIndex(self):
            return UniAssemblyParser.RULE_relocation_expr

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterRelocation_expr" ):
                listener.enterRelocation_expr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitRelocation_expr" ):
                listener.exitRelocation_expr(self)




    def relocation_expr(self):

        localctx = UniAssemblyParser.Relocation_exprContext(self, self._ctx, self.state)
        self.enterRule(localctx, 16, self.RULE_relocation_expr)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 111
            self.match(UniAssemblyParser.HASH)
            self.state = 112
            self.match(UniAssemblyParser.COLON)
            self.state = 113
            self.match(UniAssemblyParser.SYMBOL)
            self.state = 114
            self.match(UniAssemblyParser.COLON)
            self.state = 115
            self.match(UniAssemblyParser.SYMBOL)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ExpressionContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def DOT(self):
            return self.getToken(UniAssemblyParser.DOT, 0)

        def MINUS(self):
            return self.getToken(UniAssemblyParser.MINUS, 0)

        def SYMBOL(self):
            return self.getToken(UniAssemblyParser.SYMBOL, 0)

        def getRuleIndex(self):
            return UniAssemblyParser.RULE_expression

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterExpression" ):
                listener.enterExpression(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitExpression" ):
                listener.exitExpression(self)




    def expression(self):

        localctx = UniAssemblyParser.ExpressionContext(self, self._ctx, self.state)
        self.enterRule(localctx, 18, self.RULE_expression)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 117
            self.match(UniAssemblyParser.DOT)
            self.state = 118
            self.match(UniAssemblyParser.MINUS)
            self.state = 119
            self.match(UniAssemblyParser.SYMBOL)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class OperandContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def REGISTER(self):
            return self.getToken(UniAssemblyParser.REGISTER, 0)

        def memory_operand(self):
            return self.getTypedRuleContext(UniAssemblyParser.Memory_operandContext,0)


        def modified_symbol(self):
            return self.getTypedRuleContext(UniAssemblyParser.Modified_symbolContext,0)


        def expression(self):
            return self.getTypedRuleContext(UniAssemblyParser.ExpressionContext,0)


        def NUMBER(self):
            return self.getToken(UniAssemblyParser.NUMBER, 0)

        def IMMEDIATE(self):
            return self.getToken(UniAssemblyParser.IMMEDIATE, 0)

        def SYMBOL(self):
            return self.getToken(UniAssemblyParser.SYMBOL, 0)

        def DOT_SYMBOL(self):
            return self.getToken(UniAssemblyParser.DOT_SYMBOL, 0)

        def STRING(self):
            return self.getToken(UniAssemblyParser.STRING, 0)

        def getRuleIndex(self):
            return UniAssemblyParser.RULE_operand

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterOperand" ):
                listener.enterOperand(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitOperand" ):
                listener.exitOperand(self)




    def operand(self):

        localctx = UniAssemblyParser.OperandContext(self, self._ctx, self.state)
        self.enterRule(localctx, 20, self.RULE_operand)
        try:
            self.state = 130
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,10,self._ctx)
            if la_ == 1:
                self.enterOuterAlt(localctx, 1)
                self.state = 121
                self.match(UniAssemblyParser.REGISTER)
                pass

            elif la_ == 2:
                self.enterOuterAlt(localctx, 2)
                self.state = 122
                self.memory_operand()
                pass

            elif la_ == 3:
                self.enterOuterAlt(localctx, 3)
                self.state = 123
                self.modified_symbol()
                pass

            elif la_ == 4:
                self.enterOuterAlt(localctx, 4)
                self.state = 124
                self.expression()
                pass

            elif la_ == 5:
                self.enterOuterAlt(localctx, 5)
                self.state = 125
                self.match(UniAssemblyParser.NUMBER)
                pass

            elif la_ == 6:
                self.enterOuterAlt(localctx, 6)
                self.state = 126
                self.match(UniAssemblyParser.IMMEDIATE)
                pass

            elif la_ == 7:
                self.enterOuterAlt(localctx, 7)
                self.state = 127
                self.match(UniAssemblyParser.SYMBOL)
                pass

            elif la_ == 8:
                self.enterOuterAlt(localctx, 8)
                self.state = 128
                self.match(UniAssemblyParser.DOT_SYMBOL)
                pass

            elif la_ == 9:
                self.enterOuterAlt(localctx, 9)
                self.state = 129
                self.match(UniAssemblyParser.STRING)
                pass


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx





