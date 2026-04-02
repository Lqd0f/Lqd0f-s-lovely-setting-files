/*                           nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn 
                            E                                  3
                            E  Koalas are the CUTEST animals.  3 
                            E                                  3
                             uuuuuuuuuuuuuuuuuuuuuuuu   uuuuuuu
                                                     | /  
                                                     |/
          `-^'-';-.             .":^_"":;;^'``...`.-;;":,
         _-       .__-      __~^                      '___    '~-_'^^,_,
        G            .^^`~^~               ._             ^__"`        S
        v             _!-              "_~-  '^'            ."`       \`
         w          _^               ,!         .+            "_      ..!`^
        _.        ,^                =             =            `=         `<
        =        _^               '"              `"             1         >
        _       1                ^;                /              r       ,;
         <     1                !                  `_              \        =
         X    !                -'                   4              ":        _`
         5   .,    ,3y_        =                    4               o     ';_
         "_  v     -Tt'       =                     4                ^.'_,`
           ,\                 6                     \      ~##v      E
            5                 5                    +        +1`      1
            !                 v                   ~.                 ,
            `                  =                 \`                  E
            u                   +!             =+                    `
 ', "`      -`                    "' "+++++. +                     `\        `
 !    '-     ^"                                                  `!_     ."-` '"
 ^      ^      ^".                                            .^-":     !-      ?
 !       +       .__":_                                 ._-_,,_`       -       ^
 =                    ,":_":":_.^^^_,'..-_^^^^_.,~_--__'__                       <
  =                                                                          +
  `"                                                                        ".
   `\                                                                      !.
                                                                          `
*/

import "dart:io";
import "dart:math";
import "dart:convert";
import "dart:typed_data";

class OwnRdr{

  late final Uint8List _buf;
  int _ptr = 0;

  OwnRdr(){
    _buf = File('/dev/stdin').readAsBytesSync();
  }

	// <= 32 ... 空白(ASCII:32)，改行(ASCII:10)である
	// 32 < .... 文字(ASCII:33以降)である
	// == 45 ... ハイフン(ASCII:45)である

	void _skp(){
		while(_ptr < _buf.length && _buf[_ptr] <= 32){_ptr++;}
	}

	string nxStr(){
		_skp();
		if(_buf.length <= _ptr){return "";}

		int _stt = _ptr;
		while(_ptr < _buf.length && 32 < _buf[_ptr]){_ptr++;}
		return String.fromCharCodes(_buf, _stt, _ptr);
	}

  int nxInt(){
		_skp();
    if(_buf.length <= _ptr){return 0;}

    bool _neg = false;
    if(_buf[_ptr] == 45){
      _neg = true;
      _ptr++;
    }

    int _rtn = 0;
    while(_ptr < _buf.length && 32 < _buf[_ptr]){
      _rtn = _rtn * 10 + (_buf[_ptr]-48);
      _ptr++;
    }
    return (_neg? -_rtn:_rtn);
  }

	double nxDub(){
		String _nex = nxStr();
		return (_nex.isEmpty? 0.0:double.parse(_nex));
	}
}

void main(){

	final or = OwnRdr();
	var sb = StringBuffer();
	/**//*************//**/
 /**/	var isMl = 0; /**/
/**//*************//**/
	var tc = 1;
	if(isMl==1){tc = or.nxInt();}
	for(int i = 0;i < tc;i++){solv(or, sb);}
	stdout.write(sb);
}

int solv(OwnRdr rd, StringBuffer buff){

	var N = rd.nxInt();

	return 0;
}
