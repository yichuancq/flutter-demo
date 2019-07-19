//dto解析网络数据
//https://javiercbk.github.io/json_to_dart/
class EarthQuakeInfoDTO {
  //数据
  List<Shuju> shuju;
  String jieguo;
  String page;
  int num;

  EarthQuakeInfoDTO({this.shuju, this.jieguo, this.page, this.num});

  EarthQuakeInfoDTO.fromJson(Map<String, dynamic> json) {
    if (json['shuju'] != null) {
      shuju = new List<Shuju>();
      json['shuju'].forEach((v) {
        shuju.add(new Shuju.fromJson(v));
      });
    }
    if (json['page'] != null || !json['page'].isEmpty) {
      page = "";
    }
    jieguo = json['jieguo'];
    num = json['num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shuju != null) {
      data['shuju'] = this.shuju.map((v) => v.toJson()).toList();
    }
    data['jieguo'] = this.jieguo;
    data['page'] = this.page;
    data['num'] = this.num;
    return data;
  }
}

class Shuju {
  String id;
  String cATAID;
  String sAVETIME;
  String oTIME;
  String ePILAT;
  String ePILON;
  int ePIDEPTH;
  String aUTOFLAG;
  String eQTYPE;
  String oTIMEFRA;
  String m;
  String mMS;
  String mMS7;
  String mML;
  String mMB;
  String mMB2;
  String sUMSTN;
  String lOCSTN;
  String lOCATIONC;
  String lOCATIONS;
  String cATATYPE;
  String sYNCTIME;
  String iSDEL;
  String eQCATATYPE;
  String nEWDID;

  Shuju(
      {this.id,
      this.cATAID,
      this.sAVETIME,
      this.oTIME,
      this.ePILAT,
      this.ePILON,
      this.ePIDEPTH,
      this.aUTOFLAG,
      this.eQTYPE,
      this.oTIMEFRA,
      this.m,
      this.mMS,
      this.mMS7,
      this.mML,
      this.mMB,
      this.mMB2,
      this.sUMSTN,
      this.lOCSTN,
      this.lOCATIONC,
      this.lOCATIONS,
      this.cATATYPE,
      this.sYNCTIME,
      this.iSDEL,
      this.eQCATATYPE,
      this.nEWDID});

  @override
  String toString() {
    return 'Shuju{id: $id, oTIME: $oTIME, ePIDEPTH: $ePIDEPTH, m: $m, lOCATIONC: $lOCATIONC}';
  }

  //解析Json
  Shuju.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cATAID = json['CATA_ID'];
    sAVETIME = json['SAVE_TIME'];
    oTIME = json['O_TIME'];
    ePILAT = json['EPI_LAT'];
    ePILON = json['EPI_LON'];
    ePIDEPTH = json['EPI_DEPTH'];
    aUTOFLAG = json['AUTO_FLAG'];
    eQTYPE = json['EQ_TYPE'];
    oTIMEFRA = json['O_TIME_FRA'];
    m = json['M'];
    mMS = json['M_MS'];
    mMS7 = json['M_MS7'];
    mML = json['M_ML'];
    mMB = json['M_MB'];
    mMB2 = json['M_MB2'];
    sUMSTN = json['SUM_STN'];
    lOCSTN = json['LOC_STN'];
    lOCATIONC = json['LOCATION_C'];
    lOCATIONS = json['LOCATION_S'];
    cATATYPE = json['CATA_TYPE'];
    sYNCTIME = json['SYNC_TIME'];
    iSDEL = json['IS_DEL'];
    eQCATATYPE = json['EQ_CATA_TYPE'];
    nEWDID = json['NEW_DID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['CATA_ID'] = this.cATAID;
    data['SAVE_TIME'] = this.sAVETIME;
    data['O_TIME'] = this.oTIME;
    data['EPI_LAT'] = this.ePILAT;
    data['EPI_LON'] = this.ePILON;
    data['EPI_DEPTH'] = this.ePIDEPTH;
    data['AUTO_FLAG'] = this.aUTOFLAG;
    data['EQ_TYPE'] = this.eQTYPE;
    data['O_TIME_FRA'] = this.oTIMEFRA;
    data['M'] = this.m;
    data['M_MS'] = this.mMS;
    data['M_MS7'] = this.mMS7;
    data['M_ML'] = this.mML;
    data['M_MB'] = this.mMB;
    data['M_MB2'] = this.mMB2;
    data['SUM_STN'] = this.sUMSTN;
    data['LOC_STN'] = this.lOCSTN;
    data['LOCATION_C'] = this.lOCATIONC;
    data['LOCATION_S'] = this.lOCATIONS;
    data['CATA_TYPE'] = this.cATATYPE;
    data['SYNC_TIME'] = this.sYNCTIME;
    data['IS_DEL'] = this.iSDEL;
    data['EQ_CATA_TYPE'] = this.eQCATATYPE;
    data['NEW_DID'] = this.nEWDID;
    return data;
  }
}
