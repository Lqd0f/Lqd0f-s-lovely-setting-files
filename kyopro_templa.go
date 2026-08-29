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

/*

this template is published in 

https://github.com/Lqd0f/Lqd0f-s-lovely-setting-files/blob/main/kyopro_templa.go

it may help you with any porpose...? and I hope so.

*/

package main

import(
	"os"
	"fmt"
	"sort"
	"bufio"
	"strconv"
)

type OwnRdr struct{
	
	rdr *bufio.Reader
}
func NewOwnRdr() *OwnRdr{

	return &OwnRdr{rdr:bufio.NewReaderSize(os.Stdin, 1024*1024)}
}
func (ord *OwnRdr) NxStr() string{

	var wd []byte
	for{
		ch, err := ord.rdr.ReadByte()
		if err != nil {break}
		if ch <= ' ' {
			if 0 < len(wd) {break}
			continue
		}
		wd = append(wd, ch)
	}

	return string(wd)
}
func (ord *OwnRdr) NxInt() int{

	num, _ := strconv.Atoi(ord.NxStr())	
	return num; 
}
func (ord *OwnRdr) NxDub() float64{
	
	rnum, _ := strconv.ParseFloat(ord.NxStr(), 64)
	return rnum
}

func main(){

	r := NewOwnRdr()
	w := bufio.NewWriter(os.Stdout)
	defer w.Flush()
	/**//*********//**/
 /**/	isMl := 0 /**/
/**//*********//**/
	tc := 1
	if isMl == 1 {tc = r.NxInt()}
	for _i := 0;_i < tc;_i++ {solv(r, w)}
}

func solv(rd *OwnRdr, wr *bufio.Writer) int{

	N := rd.NxInt()

	return 0
}
