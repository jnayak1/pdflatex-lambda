import sys
import yum


def pdflatex(*args):
    pass


def lambda_handler(event, context):
    pass


def install_texlive_scheme_basic():
    yb = yum.YumBase()
    kwarg = {'name' : 'texlive-scheme-basic'}
    yb.install(**kwarg)
    yb.resolveDeps()
    yb.buildTransaction()
    yb.processTransaction()
