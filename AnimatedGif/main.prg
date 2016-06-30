#IF .F.

The MIT License (MIT)
Copyright (c) 2016 Deamon George Scapin

Permission is hereby granted, free of charge, to any person obtaining a copy of this software 
and associated documentation files (the "Software"), to deal in the Software without restriction, 
including without limitation the rights to use, copy, modify, merge, publish, distribute, 
sublicense, and/or sell copies of the Software, and to permit persons to whom the Software 
is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or 
substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING 
BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND 
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#ENDIF 

PUBLIC poForm
poForm = Createobject('clsForm')
poForm.Show()

DEFINE CLASS clsForm AS FORM

	PROTECTED cAnimatedGifFILE
	PROTECTED cAnimatedGifHTTP
	PROTECTED lWeb

	ADD OBJECT oBrowser AS OLECONTROL ;
		WITH OLECLASS="Shell.Explorer",;
		HEIGHT=365,WIDTH=360

  PROCEDURE oBrowser.Refresh
    NODEFAULT
  ENDPROC 

	PROCEDURE Init
		* Set .T. to use web address or .F. to use file on hard drive
		THIS.lWeb = .T.
		
		THIS.Caption = "Sample animated gif"		
		THIS.Width = 360
		THIS.Height = 365
    	THIS.AutoCenter=.T.
    	* Path to animated file on hard drive
		THIS.cAnimatedGifFILE = "file://E:\UserFolders\Documents\dev\vfp\animatedgifexample\e8nZC.gif"
		* Path to animated file on web
		THIS.cAnimatedGifHTTP= "http://i.stack.imgur.com/e8nZC.gif"
		
		WITH THIS.oBrowser
      		.Navigate2(IIF(this.lWeb,this.cAnimatedGifHTTP, this.cAnimatedGifFILE))
      		DO WHILE .ReadyState # 4
      			* Could put a sleep here
		 	ENDDO
      		.Document.body.Scroll="no"
		ENDWITH 
	ENDPROC 
ENDDEFINE 