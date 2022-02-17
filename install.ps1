git clone https://github.com/hniesewand/xelix-etl.git ~/xelix
Invoke-WebRequest -Uri "https://sourceforge.net/projects/winscp/files/WinSCP/5.20.1%20beta/WinSCP-5.20.1.beta-Portable.zip/download" -OutFile "~/xelix/winscp.zip"
Expand-Archive -LiteralPath ~/xelix/winscp.zip -DestinationPath ~/xelix/winscp