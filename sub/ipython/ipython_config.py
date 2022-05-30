from IPython.terminal.prompts import Prompts, Token
import subprocess
from pathlib import Path
import os
from platform import python_version


def get_branch():
    try:
        return " (" + (
            subprocess.check_output(
                "git branch --show-current", shell=True, stderr=subprocess.DEVNULL
            )
            .decode("utf-8")
            .replace("\n", "")
        ) + ")"
    except BaseException:
        return ""


class CustomPrompt(Prompts):

    def in_prompt_tokens(self, cli=None):
        return [
            (Token, "\n┌──("),
            (Token.Name.Class, os.getlogin()),
            (Token.Prompt, "@"),
            (Token.Name.Class, "ipython v" + python_version()),
            (Token, ")-["),
            (Token.OutPrompt, os.getcwd()),
            (Token, "]"),
            (Token.Generic.Subheading, get_branch()),
            (Token, " "),
            (Token, "\n└─"),
            (
                Token.Prompt
                if self.shell.last_execution_succeeded
                else Token.Generic.Error,
                "λ ",
            ),
        ]

    def out_prompt_tokens(self, cli=None):
        return [(Token.Prompt, ''), ]

    def continuation_prompt_tokens(self, cli=None, width=None):
        return [(Token.Prompt, ''), ]


c = get_config()

c.TerminalInteractiveShell.prompts_class = CustomPrompt
c.TerminalInteractiveShell.separate_in = ''
c.TerminalInteractiveShell.confirm_exit = False
c.TerminalIPythonApp.display_banner = False

q = exit
