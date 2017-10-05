# pdflatex-lambda (WIP)
AWS Lambda function handler for converting LaTeX documents into PDFs. Python.

### Creating TeXLive Package
- Launch an Amazon Linux EC2 instance and ssh on to it
- `wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz`
- `tar -xvzf install-tl-...`
- `cd install-tl-...`
- `install-tl -gui text`

### Using TeXLive Package
- Add /path/to/package/bin/x86_64-linux to PATH environment variable

More info on the wiki and in issues (open and closed)
