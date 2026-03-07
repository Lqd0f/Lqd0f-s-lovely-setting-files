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

#include<bits/stdc++.h>

using namespace std;

/***********************************************************************/


/* +-+-+-+-+-+-+ */
/* |           | */
/* + TYPE NAME + */
/* |           | */
/* +-+-+-+-+-+-+ */

using lnln = long long;
using lngw = long double;
using veci = vector<int>; //二次元はvector<veci>で我慢
using vecl = vector<long long>;
using vecs = vector<string>;
using vecb = vector<bool>;
using vecd = vector<double>;
using vpii = vector<pair<int,int>>;
using vpll = vector<pair<long long,long long>>;
using vpci = vector<pair<char,int>>;
using vpcl = vector<pair<char,long long>>;

/***********************************************************************/


/* OoOoOoOoO */
/* o       o */
/* O MACRO O */
/* o       o */
/* OoOoOoOoO */

#define repe(i,n) for(int i = 0;i < (n);i++)    //ただのfor
#define eper(i,n) for(int i = (n)-1;i >= 0;i--) //逆からfor

#define been(a) a.begin(),a.end()   //sort(been(A))とかできる
#define neeb(a) a.rbegin(),a.rend() //逆からそれ

#define chax(a,b) a = max(a,b) //answの更新とかに
#define chin(a,b) a = min(a,b) //上に同じく

#define outY() cout << "Yes\n" //出力さぼれて嬉しい(要セミコロン)
#define outN() cout << "No\n"	 //上に
#define outM() cout << "-1\n"	 //上に
// #define outA(n) cout << (n) << "\n" //上のやつの汎用化した
// #define outS(n) cout << (n) << " " //空白区切りもあった方が何かと便利

#define emba emplace_back

#define flg1 dbgn("flag1 \\\\ |> //")
#define flg2 dbgn("flag2 \\\\ |> //")
#define flg3 dbgn("flag3 \\\\ |> //")
#define flg4 dbgn("flag4 \\\\ |> //")
#define flg5 dbgn("flag5 \\\\ |> //")
#define flg6 dbgn("flag6 \\\\ |> //")

/***********************************************************************/


/* XxXxXxXxXxXxX */
/* x           x */
/* X UTIL FUNC X */
/* x           x */
/* XxXxXxXxXxXxX */

/* iota(beg, end, 0) を使えばいい

void makePerm(vector<int> &srce) //0-indexedの順列をつくる
{
	for(int i = 0;i < (int)srce.size();i++){
		srce[i] = i;
	}
}
*/

long long Eucl(pair<int,int> firs, pair<int,int> seco){ //ユークリッドさん

	int delf = abs(firs.first-seco.first);
	int dels = abs(firs.second-seco.second);
	return delf*delf + dels*dels;
}

int digt(long long deci){ //桁数を返す
	
	int leng = 0;
	while(deci){
		leng++;
		deci /= 10;
	}
	return leng;
}

bool isPl(string strg){ //回文判定
	
	string rvrs = strg;
	reverse(rvrs.begin(), rvrs.end());
	return strg == rvrs;
}

long long ggcd(long long firs, long long seco){

	return ((firs%seco)? ggcd(seco,firs%seco):seco);
}

vector<int> glpf(int maxi){
	
	vector<int> lpfs(maxi);
	iota(lpfs.begin(), lpfs.end(), 1);
	vector<int> prim;
	//線形篩
	for(int n = 2;n <= maxi;n++){
		if(lpfs[n-1] == n){prim.push_back(n);} //最小素因数がそれ自身なら素数
		for(auto each:prim){
			if(maxi < (long long)each*n || lpfs[n-1] < each){break;}
			lpfs[each*n -1] = each;
		}
	}
	return lpfs;
}

/***********************************************************************/


/* dbqpdbqpdbqpdbqpdb */
/* q                p */
/* d DATA STRUCTURE b */
/* q                p */
/* dbqpdbqpdbqpdbqpdb */

struct Unfi
{
	//vector<int> prnt; //頂点をindexとして，その頂点の親(自身が親 =根)
	//vector<int> scal; //根をindexとして，その連結成分の頂点数
	
	//値が負のときscal，そうでないときprntを表す．
	vector<int> pORs;

	//n個の頂点から成るUnion-Find木を構築する．最初は各頂点が根
	/*
	Unfi(size_t n):prnt(n),scal(n, 1){
		iota(been(prnt), 0);
	}
	*/
	Unfi(size_t n):pORs(n, -1){}

	//頂点vertの根を返す．
	int find(int vert){
		/*
		if(prnt[vert] == vert){return vert;}
		return prnt[vert] = find(prnt[vert]);
		*/
		return (pORs[vert] < 0? vert:(pORs[vert]=find(pORs[vert])));
	}

	//頂点firsを含む連結成分と頂点secoを含む連結成分を統合する．
	void join(int firs, int seco){
		int rotf = find(firs), rots = find(seco);
		if(rotf != rots){
			/*
			if(scal[rotf] < scal[rots]){swap(rotf, rots);}
			scal[rotf] += scal[rots];
			prnt[rots] = rotf;
			*/
			if(-pORs[rotf] < -pORs[rots]) swap(rotf, rots);
			pORs[rotf] += pORs[rots];
			pORs[rots] = rotf;
		}
	}

	//頂点firsと頂点secoが同じ連結成分に含まれているかを返す．
	bool same(int firs, int seco){
		return (find(firs) == find(seco));	
	}

	//頂点vertが含まれる連結成分の要素数を返す
	int size(int vert){
		//return scal[find(vert)];
		return -pORs[find(vert)];
	}
};

template <int modu> // using mint = Mint<P>; と使う．Pは任意の素数
struct Mint{

	long long valu;

	Mint(long long valu = 0):valu((valu+modu)%modu){}

	Mint operator -()const{
		return Mint(-valu);
	}

	Mint& operator +=(const Mint &argu){
		valu += argu.valu;
		if(modu <= valu){valu -= modu;}
		return *this;
	}
	Mint operator +(const Mint &argu)const{return Mint(*this)+=argu;}

	Mint& operator -=(const Mint &argu){
		valu += modu-argu.valu;
		if(modu <= valu){valu -= modu;}
		return *this;
	}
	Mint operator -(const Mint &argu)const{return Mint(*this)-=argu;}

	Mint& operator *=(const Mint &argu){
		valu *= argu.valu;
		valu %= modu;
		return *this;
	}
	Mint operator *(const Mint &argu)const{return Mint(*this)*=argu;}

	constexpr Mint powr(long long nowN)const{
		if(!nowN){return 1;}
		Mint nexN = powr(nowN >> 1);
		nexN *= nexN;
		if(nowN & 1){nexN *= *this;}
		return nexN;
	}

	constexpr Mint inve()const{
		return powr(modu-2);
	}

	Mint& operator /=(const Mint &argu){
		return (*this) *= argu.inve();
	}
	Mint operator /(const Mint &argu)const{return Mint(*this)/=argu;}

	bool operator ==(const Mint &argu){return valu == argu.valu;}
	bool operator !=(const Mint &argu){return !(*this == argu);}
	bool operator <(const Mint &argu){return valu < argu.valu;}
	bool operator <=(const Mint &argu){
		return (valu < argu.valu)||(*this == argu);
	}
	bool operator >(const Mint &argu){
		return !(valu <= argu);
	}
	bool operator >=(const Mint &argu)const{
		return !(*this < argu);
	}

	friend ostream& operator <<(ostream &ostr, const Mint &mint){
		ostr << mint.valu;
		return ostr;
	}
};

/***********************************************************************/


int fvch[] = {-1,0,1,0}, fvcw[] = {0,1,0,-1}; //12時から時計回り四近傍
int evch[] = {-1,-1,0,1,1,1,0,-1}, evcw[] = {0,1,1,1,0,-1,-1,-1}; //八近傍

#ifdef __LOCAL //dbgn() -> 改行区切り
#define dbgn(N) cout << (N) << "\n";
#else
#define dbgn(N);
#endif

#ifdef __LOCAL //dbgs() -> 空白区切り
#define dbgs(N) cout << (N) << " ";
#else
#define dbgs(N);
#endif

  /**//*************//**/
 /**/ int isMl = 1; /**/
/**//*************//**/
int tsCs;
int solv(void); //プロトタイプ宣言！

/* ======  GLOBAL VARIABLES  ====== */

/* ================================ */

int main(void)
{
	ios::sync_with_stdio(false); //これがあるとマルチケースでも
  cin.tie(nullptr);            //きれいに出力できるようになる

	/* ~~~~~~  INITIALIZATOIN ZONE  ~~~~~~ */

	/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
	
	if(isMl) cin >> tsCs;
	else tsCs = 1;
	for(;tsCs--;) solv();
	return 0;
}

int solv(void)
{
	int N;
	cin >> N;

	return 0;
}
