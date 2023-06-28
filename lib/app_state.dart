import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _listFelizometroJson =
          prefs.getStringList('ff_listFelizometroJson')?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _listFelizometroJson;
    });
    _safeInit(() {
      _jaAcessou = prefs.getBool('ff_jaAcessou') ?? _jaAcessou;
    });
    _safeInit(() {
      _tipoColab = prefs.getString('ff_tipoColab') ?? _tipoColab;
    });
    _safeInit(() {
      _managerName = prefs.getString('ff_managerName') ?? _managerName;
    });
    _safeInit(() {
      _userid = prefs.getInt('ff_userid') ?? _userid;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_minhasExperienciasProfissionais')) {
        try {
          _minhasExperienciasProfissionais = jsonDecode(
              prefs.getString('ff_minhasExperienciasProfissionais') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _forcaPerfilProfissional =
          prefs.getDouble('ff_forcaPerfilProfissional') ??
              _forcaPerfilProfissional;
    });
    _safeInit(() {
      _isEstrangeiro = prefs.getBool('ff_isEstrangeiro') ?? _isEstrangeiro;
    });
    _safeInit(() {
      _tokenPJ = prefs.getString('ff_tokenPJ') ?? _tokenPJ;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_showMePJData')) {
        try {
          _showMePJData = jsonDecode(prefs.getString('ff_showMePJData') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _tokenEmpresa = prefs.getString('ff_tokenEmpresa') ?? _tokenEmpresa;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_showMeDataEmpresa')) {
        try {
          _showMeDataEmpresa =
              jsonDecode(prefs.getString('ff_showMeDataEmpresa') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _prestadorID = prefs.getInt('ff_prestadorID') ?? _prestadorID;
    });
    _safeInit(() {
      _sidebarPJOpen = prefs.getBool('ff_sidebarPJOpen') ?? _sidebarPJOpen;
    });
    _safeInit(() {
      _empresaID = prefs.getString('ff_empresaID') ?? _empresaID;
    });
    _safeInit(() {
      _sidebarCNPJOpen =
          prefs.getBool('ff_sidebarCNPJOpen') ?? _sidebarCNPJOpen;
    });
    _safeInit(() {
      _perfilAcesso = prefs.getInt('ff_perfilAcesso') ?? _perfilAcesso;
    });
    _safeInit(() {
      _token = prefs.getString('ff_token') ?? _token;
    });
    _safeInit(() {
      _myPhoto = prefs.getString('ff_myPhoto') ?? _myPhoto;
    });
    _safeInit(() {
      _isManager = prefs.getBool('ff_isManager') ?? _isManager;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_dadosColab')) {
        try {
          _dadosColab = jsonDecode(prefs.getString('ff_dadosColab') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_userData')) {
        try {
          _userData = jsonDecode(prefs.getString('ff_userData') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _MyCpf = prefs.getString('ff_MyCpf') ?? _MyCpf;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _logged = false;
  bool get logged => _logged;
  set logged(bool _value) {
    _logged = _value;
  }

  bool _newPdi = false;
  bool get newPdi => _newPdi;
  set newPdi(bool _value) {
    _newPdi = _value;
  }

  bool _myPdi = true;
  bool get myPdi => _myPdi;
  set myPdi(bool _value) {
    _myPdi = _value;
  }

  bool _teamPdi = false;
  bool get teamPdi => _teamPdi;
  set teamPdi(bool _value) {
    _teamPdi = _value;
  }

  bool _Visibility = false;
  bool get Visibility => _Visibility;
  set Visibility(bool _value) {
    _Visibility = _value;
  }

  bool _detailsPDI = false;
  bool get detailsPDI => _detailsPDI;
  set detailsPDI(bool _value) {
    _detailsPDI = _value;
  }

  int _idPDI = 0;
  int get idPDI => _idPDI;
  set idPDI(int _value) {
    _idPDI = _value;
  }

  bool _showFeliz = false;
  bool get showFeliz => _showFeliz;
  set showFeliz(bool _value) {
    _showFeliz = _value;
  }

  List<dynamic> _resultJson = [];
  List<dynamic> get resultJson => _resultJson;
  set resultJson(List<dynamic> _value) {
    _resultJson = _value;
  }

  void addToResultJson(dynamic _value) {
    _resultJson.add(_value);
  }

  void removeFromResultJson(dynamic _value) {
    _resultJson.remove(_value);
  }

  void removeAtIndexFromResultJson(int _index) {
    _resultJson.removeAt(_index);
  }

  void updateResultJsonAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _resultJson[_index] = updateFn(_resultJson[_index]);
  }

  String _felizMood = '';
  String get felizMood => _felizMood;
  set felizMood(String _value) {
    _felizMood = _value;
  }

  String _felizEmoji = '';
  String get felizEmoji => _felizEmoji;
  set felizEmoji(String _value) {
    _felizEmoji = _value;
  }

  bool _progressStep2 = false;
  bool get progressStep2 => _progressStep2;
  set progressStep2(bool _value) {
    _progressStep2 = _value;
  }

  bool _progressStep3 = false;
  bool get progressStep3 => _progressStep3;
  set progressStep3(bool _value) {
    _progressStep3 = _value;
  }

  bool _sessao1 = false;
  bool get sessao1 => _sessao1;
  set sessao1(bool _value) {
    _sessao1 = _value;
  }

  bool _MCDadosPessoais = false;
  bool get MCDadosPessoais => _MCDadosPessoais;
  set MCDadosPessoais(bool _value) {
    _MCDadosPessoais = _value;
  }

  bool _MCContato = false;
  bool get MCContato => _MCContato;
  set MCContato(bool _value) {
    _MCContato = _value;
  }

  bool _MCEndereco = false;
  bool get MCEndereco => _MCEndereco;
  set MCEndereco(bool _value) {
    _MCEndereco = _value;
  }

  bool _MCSaude = false;
  bool get MCSaude => _MCSaude;
  set MCSaude(bool _value) {
    _MCSaude = _value;
  }

  bool _MCDependentes = false;
  bool get MCDependentes => _MCDependentes;
  set MCDependentes(bool _value) {
    _MCDependentes = _value;
  }

  bool _DadosPrExpe = false;
  bool get DadosPrExpe => _DadosPrExpe;
  set DadosPrExpe(bool _value) {
    _DadosPrExpe = _value;
  }

  bool _DadosPrSkills = false;
  bool get DadosPrSkills => _DadosPrSkills;
  set DadosPrSkills(bool _value) {
    _DadosPrSkills = _value;
  }

  bool _DadosPrCurric = false;
  bool get DadosPrCurric => _DadosPrCurric;
  set DadosPrCurric(bool _value) {
    _DadosPrCurric = _value;
  }

  bool _DadosAcaForma = false;
  bool get DadosAcaForma => _DadosAcaForma;
  set DadosAcaForma(bool _value) {
    _DadosAcaForma = _value;
  }

  bool _DadosAcaCertif = false;
  bool get DadosAcaCertif => _DadosAcaCertif;
  set DadosAcaCertif(bool _value) {
    _DadosAcaCertif = _value;
  }

  bool _DadosAcaLicenc = false;
  bool get DadosAcaLicenc => _DadosAcaLicenc;
  set DadosAcaLicenc(bool _value) {
    _DadosAcaLicenc = _value;
  }

  String _test = '';
  String get test => _test;
  set test(String _value) {
    _test = _value;
  }

  bool _confirmContactFeliz = false;
  bool get confirmContactFeliz => _confirmContactFeliz;
  set confirmContactFeliz(bool _value) {
    _confirmContactFeliz = _value;
  }

  int _idFelizometro = 0;
  int get idFelizometro => _idFelizometro;
  set idFelizometro(int _value) {
    _idFelizometro = _value;
  }

  bool _detaisPDIColab = false;
  bool get detaisPDIColab => _detaisPDIColab;
  set detaisPDIColab(bool _value) {
    _detaisPDIColab = _value;
  }

  bool _activeTag = false;
  bool get activeTag => _activeTag;
  set activeTag(bool _value) {
    _activeTag = _value;
  }

  dynamic _HardSkills;
  dynamic get HardSkills => _HardSkills;
  set HardSkills(dynamic _value) {
    _HardSkills = _value;
  }

  dynamic _SoftSkills;
  dynamic get SoftSkills => _SoftSkills;
  set SoftSkills(dynamic _value) {
    _SoftSkills = _value;
  }

  bool _felizSlide1 = false;
  bool get felizSlide1 => _felizSlide1;
  set felizSlide1(bool _value) {
    _felizSlide1 = _value;
  }

  bool _felizSlide2 = false;
  bool get felizSlide2 => _felizSlide2;
  set felizSlide2(bool _value) {
    _felizSlide2 = _value;
  }

  bool _felizSentimentoOutro = false;
  bool get felizSentimentoOutro => _felizSentimentoOutro;
  set felizSentimentoOutro(bool _value) {
    _felizSentimentoOutro = _value;
  }

  String _felizOutroTitulo = '';
  String get felizOutroTitulo => _felizOutroTitulo;
  set felizOutroTitulo(String _value) {
    _felizOutroTitulo = _value;
  }

  List<dynamic> _myTemPdiJson = [];
  List<dynamic> get myTemPdiJson => _myTemPdiJson;
  set myTemPdiJson(List<dynamic> _value) {
    _myTemPdiJson = _value;
  }

  void addToMyTemPdiJson(dynamic _value) {
    _myTemPdiJson.add(_value);
  }

  void removeFromMyTemPdiJson(dynamic _value) {
    _myTemPdiJson.remove(_value);
  }

  void removeAtIndexFromMyTemPdiJson(int _index) {
    _myTemPdiJson.removeAt(_index);
  }

  void updateMyTemPdiJsonAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _myTemPdiJson[_index] = updateFn(_myTemPdiJson[_index]);
  }

  List<dynamic> _listFelizometroJson = [];
  List<dynamic> get listFelizometroJson => _listFelizometroJson;
  set listFelizometroJson(List<dynamic> _value) {
    _listFelizometroJson = _value;
    prefs.setStringList(
        'ff_listFelizometroJson', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToListFelizometroJson(dynamic _value) {
    _listFelizometroJson.add(_value);
    prefs.setStringList('ff_listFelizometroJson',
        _listFelizometroJson.map((x) => jsonEncode(x)).toList());
  }

  void removeFromListFelizometroJson(dynamic _value) {
    _listFelizometroJson.remove(_value);
    prefs.setStringList('ff_listFelizometroJson',
        _listFelizometroJson.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromListFelizometroJson(int _index) {
    _listFelizometroJson.removeAt(_index);
    prefs.setStringList('ff_listFelizometroJson',
        _listFelizometroJson.map((x) => jsonEncode(x)).toList());
  }

  void updateListFelizometroJsonAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _listFelizometroJson[_index] = updateFn(_listFelizometroJson[_index]);
    prefs.setStringList('ff_listFelizometroJson',
        _listFelizometroJson.map((x) => jsonEncode(x)).toList());
  }

  List<String> _actionPlan = [];
  List<String> get actionPlan => _actionPlan;
  set actionPlan(List<String> _value) {
    _actionPlan = _value;
  }

  void addToActionPlan(String _value) {
    _actionPlan.add(_value);
  }

  void removeFromActionPlan(String _value) {
    _actionPlan.remove(_value);
  }

  void removeAtIndexFromActionPlan(int _index) {
    _actionPlan.removeAt(_index);
  }

  void updateActionPlanAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _actionPlan[_index] = updateFn(_actionPlan[_index]);
  }

  List<dynamic> _buildJson = [];
  List<dynamic> get buildJson => _buildJson;
  set buildJson(List<dynamic> _value) {
    _buildJson = _value;
  }

  void addToBuildJson(dynamic _value) {
    _buildJson.add(_value);
  }

  void removeFromBuildJson(dynamic _value) {
    _buildJson.remove(_value);
  }

  void removeAtIndexFromBuildJson(int _index) {
    _buildJson.removeAt(_index);
  }

  void updateBuildJsonAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _buildJson[_index] = updateFn(_buildJson[_index]);
  }

  bool _dependenteUm = false;
  bool get dependenteUm => _dependenteUm;
  set dependenteUm(bool _value) {
    _dependenteUm = _value;
  }

  bool _confirmPlano = false;
  bool get confirmPlano => _confirmPlano;
  set confirmPlano(bool _value) {
    _confirmPlano = _value;
  }

  bool _dependenteDois = false;
  bool get dependenteDois => _dependenteDois;
  set dependenteDois(bool _value) {
    _dependenteDois = _value;
  }

  bool _dependenteTres = false;
  bool get dependenteTres => _dependenteTres;
  set dependenteTres(bool _value) {
    _dependenteTres = _value;
  }

  bool _dependenteQuatro = false;
  bool get dependenteQuatro => _dependenteQuatro;
  set dependenteQuatro(bool _value) {
    _dependenteQuatro = _value;
  }

  bool _dependenteCinco = false;
  bool get dependenteCinco => _dependenteCinco;
  set dependenteCinco(bool _value) {
    _dependenteCinco = _value;
  }

  String _uploadCV = '';
  String get uploadCV => _uploadCV;
  set uploadCV(String _value) {
    _uploadCV = _value;
  }

  List<String> _listPlanos = [];
  List<String> get listPlanos => _listPlanos;
  set listPlanos(List<String> _value) {
    _listPlanos = _value;
  }

  void addToListPlanos(String _value) {
    _listPlanos.add(_value);
  }

  void removeFromListPlanos(String _value) {
    _listPlanos.remove(_value);
  }

  void removeAtIndexFromListPlanos(int _index) {
    _listPlanos.removeAt(_index);
  }

  void updateListPlanosAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _listPlanos[_index] = updateFn(_listPlanos[_index]);
  }

  bool _jaAcessou = false;
  bool get jaAcessou => _jaAcessou;
  set jaAcessou(bool _value) {
    _jaAcessou = _value;
    prefs.setBool('ff_jaAcessou', _value);
  }

  List<dynamic> _myPDIjson = [];
  List<dynamic> get myPDIjson => _myPDIjson;
  set myPDIjson(List<dynamic> _value) {
    _myPDIjson = _value;
  }

  void addToMyPDIjson(dynamic _value) {
    _myPDIjson.add(_value);
  }

  void removeFromMyPDIjson(dynamic _value) {
    _myPDIjson.remove(_value);
  }

  void removeAtIndexFromMyPDIjson(int _index) {
    _myPDIjson.removeAt(_index);
  }

  void updateMyPDIjsonAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _myPDIjson[_index] = updateFn(_myPDIjson[_index]);
  }

  List<dynamic> _listPlanoJson = [];
  List<dynamic> get listPlanoJson => _listPlanoJson;
  set listPlanoJson(List<dynamic> _value) {
    _listPlanoJson = _value;
  }

  void addToListPlanoJson(dynamic _value) {
    _listPlanoJson.add(_value);
  }

  void removeFromListPlanoJson(dynamic _value) {
    _listPlanoJson.remove(_value);
  }

  void removeAtIndexFromListPlanoJson(int _index) {
    _listPlanoJson.removeAt(_index);
  }

  void updateListPlanoJsonAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _listPlanoJson[_index] = updateFn(_listPlanoJson[_index]);
  }

  dynamic _detalhesdopdi;
  dynamic get detalhesdopdi => _detalhesdopdi;
  set detalhesdopdi(dynamic _value) {
    _detalhesdopdi = _value;
  }

  dynamic _filtroColab;
  dynamic get filtroColab => _filtroColab;
  set filtroColab(dynamic _value) {
    _filtroColab = _value;
  }

  bool _modalAprovarPdi = false;
  bool get modalAprovarPdi => _modalAprovarPdi;
  set modalAprovarPdi(bool _value) {
    _modalAprovarPdi = _value;
  }

  String _tipoColab = '';
  String get tipoColab => _tipoColab;
  set tipoColab(String _value) {
    _tipoColab = _value;
    prefs.setString('ff_tipoColab', _value);
  }

  bool _hideComponent = false;
  bool get hideComponent => _hideComponent;
  set hideComponent(bool _value) {
    _hideComponent = _value;
  }

  String _myBirthday = 'Sem informação';
  String get myBirthday => _myBirthday;
  set myBirthday(String _value) {
    _myBirthday = _value;
  }

  String _myEstadoCivil = 'Sem informação';
  String get myEstadoCivil => _myEstadoCivil;
  set myEstadoCivil(String _value) {
    _myEstadoCivil = _value;
  }

  String _myEscolaridade = 'Sem informação';
  String get myEscolaridade => _myEscolaridade;
  set myEscolaridade(String _value) {
    _myEscolaridade = _value;
  }

  String _myEtnia = 'Sem informação';
  String get myEtnia => _myEtnia;
  set myEtnia(String _value) {
    _myEtnia = _value;
  }

  String _myGender = 'Sem informação';
  String get myGender => _myGender;
  set myGender(String _value) {
    _myGender = _value;
  }

  String _myOrientacao = 'Sem informação';
  String get myOrientacao => _myOrientacao;
  set myOrientacao(String _value) {
    _myOrientacao = _value;
  }

  String _myRefugiada = 'Sem informação';
  String get myRefugiada => _myRefugiada;
  set myRefugiada(String _value) {
    _myRefugiada = _value;
  }

  String _myMailPro = 'Sem informação';
  String get myMailPro => _myMailPro;
  set myMailPro(String _value) {
    _myMailPro = _value;
  }

  String _myMailAlternative = 'Sem informação';
  String get myMailAlternative => _myMailAlternative;
  set myMailAlternative(String _value) {
    _myMailAlternative = _value;
  }

  String _myPhone = 'Sem informação';
  String get myPhone => _myPhone;
  set myPhone(String _value) {
    _myPhone = _value;
  }

  String _myEmergencyName = 'Sem informação';
  String get myEmergencyName => _myEmergencyName;
  set myEmergencyName(String _value) {
    _myEmergencyName = _value;
  }

  String _myEmergencyPhone = 'Sem informação';
  String get myEmergencyPhone => _myEmergencyPhone;
  set myEmergencyPhone(String _value) {
    _myEmergencyPhone = _value;
  }

  String _myResidents = 'Sem informação';
  String get myResidents => _myResidents;
  set myResidents(String _value) {
    _myResidents = _value;
  }

  String _myCovid = 'Sem informação';
  String get myCovid => _myCovid;
  set myCovid(String _value) {
    _myCovid = _value;
  }

  String _mySaudeRelevante = 'Sem informação';
  String get mySaudeRelevante => _mySaudeRelevante;
  set mySaudeRelevante(String _value) {
    _mySaudeRelevante = _value;
  }

  String _myDependente1Name = 'Sem informação';
  String get myDependente1Name => _myDependente1Name;
  set myDependente1Name(String _value) {
    _myDependente1Name = _value;
  }

  String _myDependente2Birthday = 'Sem informação';
  String get myDependente2Birthday => _myDependente2Birthday;
  set myDependente2Birthday(String _value) {
    _myDependente2Birthday = _value;
  }

  String _myDependente1Cpf = 'Sem informação';
  String get myDependente1Cpf => _myDependente1Cpf;
  set myDependente1Cpf(String _value) {
    _myDependente1Cpf = _value;
  }

  String _myDependente1Rg = 'Sem informação';
  String get myDependente1Rg => _myDependente1Rg;
  set myDependente1Rg(String _value) {
    _myDependente1Rg = _value;
  }

  String _myDependente1Tipo = 'Sem informação';
  String get myDependente1Tipo => _myDependente1Tipo;
  set myDependente1Tipo(String _value) {
    _myDependente1Tipo = _value;
  }

  String _myDependente1Deficiencia = 'Sem informação';
  String get myDependente1Deficiencia => _myDependente1Deficiencia;
  set myDependente1Deficiencia(String _value) {
    _myDependente1Deficiencia = _value;
  }

  String _myDependente1Ajuda = 'Sem informação';
  String get myDependente1Ajuda => _myDependente1Ajuda;
  set myDependente1Ajuda(String _value) {
    _myDependente1Ajuda = _value;
  }

  dynamic _metodologias;
  dynamic get metodologias => _metodologias;
  set metodologias(dynamic _value) {
    _metodologias = _value;
  }

  dynamic _dominios;
  dynamic get dominios => _dominios;
  set dominios(dynamic _value) {
    _dominios = _value;
  }

  dynamic _idiomas;
  dynamic get idiomas => _idiomas;
  set idiomas(dynamic _value) {
    _idiomas = _value;
  }

  String _myAdressNumber = 'Sem informação';
  String get myAdressNumber => _myAdressNumber;
  set myAdressNumber(String _value) {
    _myAdressNumber = _value;
  }

  String _myAdressComplement = 'Sem informação';
  String get myAdressComplement => _myAdressComplement;
  set myAdressComplement(String _value) {
    _myAdressComplement = _value;
  }

  String _myAdressBairro = 'Sem informação';
  String get myAdressBairro => _myAdressBairro;
  set myAdressBairro(String _value) {
    _myAdressBairro = _value;
  }

  String _myAdressCity = 'Sem informação';
  String get myAdressCity => _myAdressCity;
  set myAdressCity(String _value) {
    _myAdressCity = _value;
  }

  String _myAdressState = 'Sem informação';
  String get myAdressState => _myAdressState;
  set myAdressState(String _value) {
    _myAdressState = _value;
  }

  String _myAdressCEP = 'Sem informação';
  String get myAdressCEP => _myAdressCEP;
  set myAdressCEP(String _value) {
    _myAdressCEP = _value;
  }

  List<String> _minhaSelecaoHardSkill = [];
  List<String> get minhaSelecaoHardSkill => _minhaSelecaoHardSkill;
  set minhaSelecaoHardSkill(List<String> _value) {
    _minhaSelecaoHardSkill = _value;
  }

  void addToMinhaSelecaoHardSkill(String _value) {
    _minhaSelecaoHardSkill.add(_value);
  }

  void removeFromMinhaSelecaoHardSkill(String _value) {
    _minhaSelecaoHardSkill.remove(_value);
  }

  void removeAtIndexFromMinhaSelecaoHardSkill(int _index) {
    _minhaSelecaoHardSkill.removeAt(_index);
  }

  void updateMinhaSelecaoHardSkillAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _minhaSelecaoHardSkill[_index] = updateFn(_minhaSelecaoHardSkill[_index]);
  }

  List<String> _minhaSelecaoHardStringJson = [];
  List<String> get minhaSelecaoHardStringJson => _minhaSelecaoHardStringJson;
  set minhaSelecaoHardStringJson(List<String> _value) {
    _minhaSelecaoHardStringJson = _value;
  }

  void addToMinhaSelecaoHardStringJson(String _value) {
    _minhaSelecaoHardStringJson.add(_value);
  }

  void removeFromMinhaSelecaoHardStringJson(String _value) {
    _minhaSelecaoHardStringJson.remove(_value);
  }

  void removeAtIndexFromMinhaSelecaoHardStringJson(int _index) {
    _minhaSelecaoHardStringJson.removeAt(_index);
  }

  void updateMinhaSelecaoHardStringJsonAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _minhaSelecaoHardStringJson[_index] =
        updateFn(_minhaSelecaoHardStringJson[_index]);
  }

  String _colabCity = '';
  String get colabCity => _colabCity;
  set colabCity(String _value) {
    _colabCity = _value;
  }

  bool _modalCancelaPDI = false;
  bool get modalCancelaPDI => _modalCancelaPDI;
  set modalCancelaPDI(bool _value) {
    _modalCancelaPDI = _value;
  }

  bool _modalConfirmaTask = false;
  bool get modalConfirmaTask => _modalConfirmaTask;
  set modalConfirmaTask(bool _value) {
    _modalConfirmaTask = _value;
  }

  int _idplanoacao = 0;
  int get idplanoacao => _idplanoacao;
  set idplanoacao(int _value) {
    _idplanoacao = _value;
  }

  String _managerName = '';
  String get managerName => _managerName;
  set managerName(String _value) {
    _managerName = _value;
    prefs.setString('ff_managerName', _value);
  }

  bool _hidefilterpdi = false;
  bool get hidefilterpdi => _hidefilterpdi;
  set hidefilterpdi(bool _value) {
    _hidefilterpdi = _value;
  }

  bool _mouseBlock = false;
  bool get mouseBlock => _mouseBlock;
  set mouseBlock(bool _value) {
    _mouseBlock = _value;
  }

  bool _buttonDisabled = false;
  bool get buttonDisabled => _buttonDisabled;
  set buttonDisabled(bool _value) {
    _buttonDisabled = _value;
  }

  String _aspas = '\"';
  String get aspas => _aspas;
  set aspas(String _value) {
    _aspas = _value;
  }

  List<dynamic> _meujson = [];
  List<dynamic> get meujson => _meujson;
  set meujson(List<dynamic> _value) {
    _meujson = _value;
  }

  void addToMeujson(dynamic _value) {
    _meujson.add(_value);
  }

  void removeFromMeujson(dynamic _value) {
    _meujson.remove(_value);
  }

  void removeAtIndexFromMeujson(int _index) {
    _meujson.removeAt(_index);
  }

  void updateMeujsonAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _meujson[_index] = updateFn(_meujson[_index]);
  }

  List<dynamic> _myProjects = [];
  List<dynamic> get myProjects => _myProjects;
  set myProjects(List<dynamic> _value) {
    _myProjects = _value;
  }

  void addToMyProjects(dynamic _value) {
    _myProjects.add(_value);
  }

  void removeFromMyProjects(dynamic _value) {
    _myProjects.remove(_value);
  }

  void removeAtIndexFromMyProjects(int _index) {
    _myProjects.removeAt(_index);
  }

  void updateMyProjectsAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _myProjects[_index] = updateFn(_myProjects[_index]);
  }

  bool _modalExcluiExperiencia = false;
  bool get modalExcluiExperiencia => _modalExcluiExperiencia;
  set modalExcluiExperiencia(bool _value) {
    _modalExcluiExperiencia = _value;
  }

  dynamic _myHardSkillSelect;
  dynamic get myHardSkillSelect => _myHardSkillSelect;
  set myHardSkillSelect(dynamic _value) {
    _myHardSkillSelect = _value;
  }

  int _idcompetencias = 0;
  int get idcompetencias => _idcompetencias;
  set idcompetencias(int _value) {
    _idcompetencias = _value;
  }

  String _nomecompetencia = '';
  String get nomecompetencia => _nomecompetencia;
  set nomecompetencia(String _value) {
    _nomecompetencia = _value;
  }

  int _idnivelcompetencia = 0;
  int get idnivelcompetencia => _idnivelcompetencia;
  set idnivelcompetencia(int _value) {
    _idnivelcompetencia = _value;
  }

  bool _atualizaNivelHardSkill = false;
  bool get atualizaNivelHardSkill => _atualizaNivelHardSkill;
  set atualizaNivelHardSkill(bool _value) {
    _atualizaNivelHardSkill = _value;
  }

  List<dynamic> _idcolabjson = [];
  List<dynamic> get idcolabjson => _idcolabjson;
  set idcolabjson(List<dynamic> _value) {
    _idcolabjson = _value;
  }

  void addToIdcolabjson(dynamic _value) {
    _idcolabjson.add(_value);
  }

  void removeFromIdcolabjson(dynamic _value) {
    _idcolabjson.remove(_value);
  }

  void removeAtIndexFromIdcolabjson(int _index) {
    _idcolabjson.removeAt(_index);
  }

  void updateIdcolabjsonAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _idcolabjson[_index] = updateFn(_idcolabjson[_index]);
  }

  int _userid = 0;
  int get userid => _userid;
  set userid(int _value) {
    _userid = _value;
    prefs.setInt('ff_userid', _value);
  }

  String _dataSelecionada = 'Selecione o prazo...';
  String get dataSelecionada => _dataSelecionada;
  set dataSelecionada(String _value) {
    _dataSelecionada = _value;
  }

  List<dynamic> _pjVinculados = [];
  List<dynamic> get pjVinculados => _pjVinculados;
  set pjVinculados(List<dynamic> _value) {
    _pjVinculados = _value;
  }

  void addToPjVinculados(dynamic _value) {
    _pjVinculados.add(_value);
  }

  void removeFromPjVinculados(dynamic _value) {
    _pjVinculados.remove(_value);
  }

  void removeAtIndexFromPjVinculados(int _index) {
    _pjVinculados.removeAt(_index);
  }

  void updatePjVinculadosAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _pjVinculados[_index] = updateFn(_pjVinculados[_index]);
  }

  List<dynamic> _alocados = [];
  List<dynamic> get alocados => _alocados;
  set alocados(List<dynamic> _value) {
    _alocados = _value;
  }

  void addToAlocados(dynamic _value) {
    _alocados.add(_value);
  }

  void removeFromAlocados(dynamic _value) {
    _alocados.remove(_value);
  }

  void removeAtIndexFromAlocados(int _index) {
    _alocados.removeAt(_index);
  }

  void updateAlocadosAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _alocados[_index] = updateFn(_alocados[_index]);
  }

  bool _pjEncontrado = false;
  bool get pjEncontrado => _pjEncontrado;
  set pjEncontrado(bool _value) {
    _pjEncontrado = _value;
  }

  dynamic _minhasExperienciasProfissionais;
  dynamic get minhasExperienciasProfissionais =>
      _minhasExperienciasProfissionais;
  set minhasExperienciasProfissionais(dynamic _value) {
    _minhasExperienciasProfissionais = _value;
    prefs.setString('ff_minhasExperienciasProfissionais', jsonEncode(_value));
  }

  bool _editaExperienciaPro = false;
  bool get editaExperienciaPro => _editaExperienciaPro;
  set editaExperienciaPro(bool _value) {
    _editaExperienciaPro = _value;
  }

  int _idsoftskill = 0;
  int get idsoftskill => _idsoftskill;
  set idsoftskill(int _value) {
    _idsoftskill = _value;
  }

  String _nomesoftskill = '';
  String get nomesoftskill => _nomesoftskill;
  set nomesoftskill(String _value) {
    _nomesoftskill = _value;
  }

  bool _atualizaNivelSoftskill = false;
  bool get atualizaNivelSoftskill => _atualizaNivelSoftskill;
  set atualizaNivelSoftskill(bool _value) {
    _atualizaNivelSoftskill = _value;
  }

  int _idnivelsoftskill = 0;
  int get idnivelsoftskill => _idnivelsoftskill;
  set idnivelsoftskill(int _value) {
    _idnivelsoftskill = _value;
  }

  bool _editaDependente = false;
  bool get editaDependente => _editaDependente;
  set editaDependente(bool _value) {
    _editaDependente = _value;
  }

  double _coluna1 = 750;
  double get coluna1 => _coluna1;
  set coluna1(double _value) {
    _coluna1 = _value;
  }

  double _coluna2 = 528;
  double get coluna2 => _coluna2;
  set coluna2(double _value) {
    _coluna2 = _value;
  }

  dynamic _salvaDados;
  dynamic get salvaDados => _salvaDados;
  set salvaDados(dynamic _value) {
    _salvaDados = _value;
  }

  bool _modalExcluirDepend = false;
  bool get modalExcluirDepend => _modalExcluirDepend;
  set modalExcluirDepend(bool _value) {
    _modalExcluirDepend = _value;
  }

  int _iddependente = 0;
  int get iddependente => _iddependente;
  set iddependente(int _value) {
    _iddependente = _value;
  }

  dynamic _dependenteJson;
  dynamic get dependenteJson => _dependenteJson;
  set dependenteJson(dynamic _value) {
    _dependenteJson = _value;
  }

  dynamic _salvarSrs;
  dynamic get salvarSrs => _salvarSrs;
  set salvarSrs(dynamic _value) {
    _salvarSrs = _value;
  }

  dynamic _hierarquia;
  dynamic get hierarquia => _hierarquia;
  set hierarquia(dynamic _value) {
    _hierarquia = _value;
  }

  bool _excluirexppro = false;
  bool get excluirexppro => _excluirexppro;
  set excluirexppro(bool _value) {
    _excluirexppro = _value;
  }

  int _idexpro = 0;
  int get idexpro => _idexpro;
  set idexpro(int _value) {
    _idexpro = _value;
  }

  String _nomeformacao = '';
  String get nomeformacao => _nomeformacao;
  set nomeformacao(String _value) {
    _nomeformacao = _value;
  }

  int _idformacao = 0;
  int get idformacao => _idformacao;
  set idformacao(int _value) {
    _idformacao = _value;
  }

  bool _atualizaNivelFormacao = false;
  bool get atualizaNivelFormacao => _atualizaNivelFormacao;
  set atualizaNivelFormacao(bool _value) {
    _atualizaNivelFormacao = _value;
  }

  bool _modalExcluirFormacao = false;
  bool get modalExcluirFormacao => _modalExcluirFormacao;
  set modalExcluirFormacao(bool _value) {
    _modalExcluirFormacao = _value;
  }

  dynamic _myFormacao;
  dynamic get myFormacao => _myFormacao;
  set myFormacao(dynamic _value) {
    _myFormacao = _value;
  }

  bool _modalCamposForm = false;
  bool get modalCamposForm => _modalCamposForm;
  set modalCamposForm(bool _value) {
    _modalCamposForm = _value;
  }

  dynamic _contatoEmergJson;
  dynamic get contatoEmergJson => _contatoEmergJson;
  set contatoEmergJson(dynamic _value) {
    _contatoEmergJson = _value;
  }

  bool _loadingModal = true;
  bool get loadingModal => _loadingModal;
  set loadingModal(bool _value) {
    _loadingModal = _value;
  }

  String _contatoEmergJsonString = '';
  String get contatoEmergJsonString => _contatoEmergJsonString;
  set contatoEmergJsonString(String _value) {
    _contatoEmergJsonString = _value;
  }

  bool _editandoContato2 = true;
  bool get editandoContato2 => _editandoContato2;
  set editandoContato2(bool _value) {
    _editandoContato2 = _value;
  }

  bool _contatoEmerg2 = false;
  bool get contatoEmerg2 => _contatoEmerg2;
  set contatoEmerg2(bool _value) {
    _contatoEmerg2 = _value;
  }

  dynamic _meusContatosEmerg;
  dynamic get meusContatosEmerg => _meusContatosEmerg;
  set meusContatosEmerg(dynamic _value) {
    _meusContatosEmerg = _value;
  }

  double _forcaPerfilProfissional = 0.0;
  double get forcaPerfilProfissional => _forcaPerfilProfissional;
  set forcaPerfilProfissional(double _value) {
    _forcaPerfilProfissional = _value;
    prefs.setDouble('ff_forcaPerfilProfissional', _value);
  }

  bool _modalExcluirContatoEmerg = false;
  bool get modalExcluirContatoEmerg => _modalExcluirContatoEmerg;
  set modalExcluirContatoEmerg(bool _value) {
    _modalExcluirContatoEmerg = _value;
  }

  int _orderContatoEmerg = 0;
  int get orderContatoEmerg => _orderContatoEmerg;
  set orderContatoEmerg(int _value) {
    _orderContatoEmerg = _value;
  }

  bool _modalAddPrestadorVisibility = false;
  bool get modalAddPrestadorVisibility => _modalAddPrestadorVisibility;
  set modalAddPrestadorVisibility(bool _value) {
    _modalAddPrestadorVisibility = _value;
  }

  List<dynamic> _prestadoresJSON = [];
  List<dynamic> get prestadoresJSON => _prestadoresJSON;
  set prestadoresJSON(List<dynamic> _value) {
    _prestadoresJSON = _value;
  }

  void addToPrestadoresJSON(dynamic _value) {
    _prestadoresJSON.add(_value);
  }

  void removeFromPrestadoresJSON(dynamic _value) {
    _prestadoresJSON.remove(_value);
  }

  void removeAtIndexFromPrestadoresJSON(int _index) {
    _prestadoresJSON.removeAt(_index);
  }

  void updatePrestadoresJSONAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _prestadoresJSON[_index] = updateFn(_prestadoresJSON[_index]);
  }

  bool _prestadorNaoEncontradoBannerVisibility = false;
  bool get prestadorNaoEncontradoBannerVisibility =>
      _prestadorNaoEncontradoBannerVisibility;
  set prestadorNaoEncontradoBannerVisibility(bool _value) {
    _prestadorNaoEncontradoBannerVisibility = _value;
  }

  bool _prestadorJaCadastradoBanner = false;
  bool get prestadorJaCadastradoBanner => _prestadorJaCadastradoBanner;
  set prestadorJaCadastradoBanner(bool _value) {
    _prestadorJaCadastradoBanner = _value;
  }

  int _numContatosEmerg = 0;
  int get numContatosEmerg => _numContatosEmerg;
  set numContatosEmerg(int _value) {
    _numContatosEmerg = _value;
  }

  bool _modalAddContatoEmerg = false;
  bool get modalAddContatoEmerg => _modalAddContatoEmerg;
  set modalAddContatoEmerg(bool _value) {
    _modalAddContatoEmerg = _value;
  }

  dynamic _prestadorJSON;
  dynamic get prestadorJSON => _prestadorJSON;
  set prestadorJSON(dynamic _value) {
    _prestadorJSON = _value;
  }

  List<dynamic> _projetosPrestadorJSON = [];
  List<dynamic> get projetosPrestadorJSON => _projetosPrestadorJSON;
  set projetosPrestadorJSON(List<dynamic> _value) {
    _projetosPrestadorJSON = _value;
  }

  void addToProjetosPrestadorJSON(dynamic _value) {
    _projetosPrestadorJSON.add(_value);
  }

  void removeFromProjetosPrestadorJSON(dynamic _value) {
    _projetosPrestadorJSON.remove(_value);
  }

  void removeAtIndexFromProjetosPrestadorJSON(int _index) {
    _projetosPrestadorJSON.removeAt(_index);
  }

  void updateProjetosPrestadorJSONAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _projetosPrestadorJSON[_index] = updateFn(_projetosPrestadorJSON[_index]);
  }

  List<int> _projetosIdsPrestadorJSON = [];
  List<int> get projetosIdsPrestadorJSON => _projetosIdsPrestadorJSON;
  set projetosIdsPrestadorJSON(List<int> _value) {
    _projetosIdsPrestadorJSON = _value;
  }

  void addToProjetosIdsPrestadorJSON(int _value) {
    _projetosIdsPrestadorJSON.add(_value);
  }

  void removeFromProjetosIdsPrestadorJSON(int _value) {
    _projetosIdsPrestadorJSON.remove(_value);
  }

  void removeAtIndexFromProjetosIdsPrestadorJSON(int _index) {
    _projetosIdsPrestadorJSON.removeAt(_index);
  }

  void updateProjetosIdsPrestadorJSONAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _projetosIdsPrestadorJSON[_index] =
        updateFn(_projetosIdsPrestadorJSON[_index]);
  }

  List<dynamic> _prestadoresJSONTodos = [];
  List<dynamic> get prestadoresJSONTodos => _prestadoresJSONTodos;
  set prestadoresJSONTodos(List<dynamic> _value) {
    _prestadoresJSONTodos = _value;
  }

  void addToPrestadoresJSONTodos(dynamic _value) {
    _prestadoresJSONTodos.add(_value);
  }

  void removeFromPrestadoresJSONTodos(dynamic _value) {
    _prestadoresJSONTodos.remove(_value);
  }

  void removeAtIndexFromPrestadoresJSONTodos(int _index) {
    _prestadoresJSONTodos.removeAt(_index);
  }

  void updatePrestadoresJSONTodosAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _prestadoresJSONTodos[_index] = updateFn(_prestadoresJSONTodos[_index]);
  }

  List<dynamic> _myLastPDI = [];
  List<dynamic> get myLastPDI => _myLastPDI;
  set myLastPDI(List<dynamic> _value) {
    _myLastPDI = _value;
  }

  void addToMyLastPDI(dynamic _value) {
    _myLastPDI.add(_value);
  }

  void removeFromMyLastPDI(dynamic _value) {
    _myLastPDI.remove(_value);
  }

  void removeAtIndexFromMyLastPDI(int _index) {
    _myLastPDI.removeAt(_index);
  }

  void updateMyLastPDIAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _myLastPDI[_index] = updateFn(_myLastPDI[_index]);
  }

  bool _isEstrangeiro = false;
  bool get isEstrangeiro => _isEstrangeiro;
  set isEstrangeiro(bool _value) {
    _isEstrangeiro = _value;
    prefs.setBool('ff_isEstrangeiro', _value);
  }

  List<dynamic> _allTicketsJSON = [];
  List<dynamic> get allTicketsJSON => _allTicketsJSON;
  set allTicketsJSON(List<dynamic> _value) {
    _allTicketsJSON = _value;
  }

  void addToAllTicketsJSON(dynamic _value) {
    _allTicketsJSON.add(_value);
  }

  void removeFromAllTicketsJSON(dynamic _value) {
    _allTicketsJSON.remove(_value);
  }

  void removeAtIndexFromAllTicketsJSON(int _index) {
    _allTicketsJSON.removeAt(_index);
  }

  void updateAllTicketsJSONAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _allTicketsJSON[_index] = updateFn(_allTicketsJSON[_index]);
  }

  String _myUSAdressName = 'Sem informação';
  String get myUSAdressName => _myUSAdressName;
  set myUSAdressName(String _value) {
    _myUSAdressName = _value;
  }

  String _myUSAdressLine1 = 'Sem informação';
  String get myUSAdressLine1 => _myUSAdressLine1;
  set myUSAdressLine1(String _value) {
    _myUSAdressLine1 = _value;
  }

  String _myUSAdressLine2 = 'Sem informação';
  String get myUSAdressLine2 => _myUSAdressLine2;
  set myUSAdressLine2(String _value) {
    _myUSAdressLine2 = _value;
  }

  String _myUSAdressCity = 'Sem informação';
  String get myUSAdressCity => _myUSAdressCity;
  set myUSAdressCity(String _value) {
    _myUSAdressCity = _value;
  }

  String _myUSAdressState = 'Sem informação';
  String get myUSAdressState => _myUSAdressState;
  set myUSAdressState(String _value) {
    _myUSAdressState = _value;
  }

  String _myUSAdressZIP = 'Sem informação';
  String get myUSAdressZIP => _myUSAdressZIP;
  set myUSAdressZIP(String _value) {
    _myUSAdressZIP = _value;
  }

  String _myUSAdressCountry = 'Sem informação';
  String get myUSAdressCountry => _myUSAdressCountry;
  set myUSAdressCountry(String _value) {
    _myUSAdressCountry = _value;
  }

  String _myUSAdressResidents = 'Sem informação';
  String get myUSAdressResidents => _myUSAdressResidents;
  set myUSAdressResidents(String _value) {
    _myUSAdressResidents = _value;
  }

  bool _atualizaNivelMetodologia = false;
  bool get atualizaNivelMetodologia => _atualizaNivelMetodologia;
  set atualizaNivelMetodologia(bool _value) {
    _atualizaNivelMetodologia = _value;
  }

  bool _atualizaNivelDominios = false;
  bool get atualizaNivelDominios => _atualizaNivelDominios;
  set atualizaNivelDominios(bool _value) {
    _atualizaNivelDominios = _value;
  }

  bool _atualizaNivelIdiomas = false;
  bool get atualizaNivelIdiomas => _atualizaNivelIdiomas;
  set atualizaNivelIdiomas(bool _value) {
    _atualizaNivelIdiomas = _value;
  }

  String _nomeMetodologia = '';
  String get nomeMetodologia => _nomeMetodologia;
  set nomeMetodologia(String _value) {
    _nomeMetodologia = _value;
  }

  int _idMetodologia = 0;
  int get idMetodologia => _idMetodologia;
  set idMetodologia(int _value) {
    _idMetodologia = _value;
  }

  int _idNivelMetodologia = 0;
  int get idNivelMetodologia => _idNivelMetodologia;
  set idNivelMetodologia(int _value) {
    _idNivelMetodologia = _value;
  }

  int _idDominio = 0;
  int get idDominio => _idDominio;
  set idDominio(int _value) {
    _idDominio = _value;
  }

  String _nomeDominio = '';
  String get nomeDominio => _nomeDominio;
  set nomeDominio(String _value) {
    _nomeDominio = _value;
  }

  int _idNivelDominio = 0;
  int get idNivelDominio => _idNivelDominio;
  set idNivelDominio(int _value) {
    _idNivelDominio = _value;
  }

  bool _atualizaNivelDominio = false;
  bool get atualizaNivelDominio => _atualizaNivelDominio;
  set atualizaNivelDominio(bool _value) {
    _atualizaNivelDominio = _value;
  }

  List<dynamic> _allTicketsJSONTodos = [];
  List<dynamic> get allTicketsJSONTodos => _allTicketsJSONTodos;
  set allTicketsJSONTodos(List<dynamic> _value) {
    _allTicketsJSONTodos = _value;
  }

  void addToAllTicketsJSONTodos(dynamic _value) {
    _allTicketsJSONTodos.add(_value);
  }

  void removeFromAllTicketsJSONTodos(dynamic _value) {
    _allTicketsJSONTodos.remove(_value);
  }

  void removeAtIndexFromAllTicketsJSONTodos(int _index) {
    _allTicketsJSONTodos.removeAt(_index);
  }

  void updateAllTicketsJSONTodosAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _allTicketsJSONTodos[_index] = updateFn(_allTicketsJSONTodos[_index]);
  }

  List<dynamic> _allTickesConcluidosJSON = [];
  List<dynamic> get allTickesConcluidosJSON => _allTickesConcluidosJSON;
  set allTickesConcluidosJSON(List<dynamic> _value) {
    _allTickesConcluidosJSON = _value;
  }

  void addToAllTickesConcluidosJSON(dynamic _value) {
    _allTickesConcluidosJSON.add(_value);
  }

  void removeFromAllTickesConcluidosJSON(dynamic _value) {
    _allTickesConcluidosJSON.remove(_value);
  }

  void removeAtIndexFromAllTickesConcluidosJSON(int _index) {
    _allTickesConcluidosJSON.removeAt(_index);
  }

  void updateAllTickesConcluidosJSONAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _allTickesConcluidosJSON[_index] =
        updateFn(_allTickesConcluidosJSON[_index]);
  }

  int _idIdioma = 0;
  int get idIdioma => _idIdioma;
  set idIdioma(int _value) {
    _idIdioma = _value;
  }

  int _idNivelIdioma = 0;
  int get idNivelIdioma => _idNivelIdioma;
  set idNivelIdioma(int _value) {
    _idNivelIdioma = _value;
  }

  String _nomeIdioma = '';
  String get nomeIdioma => _nomeIdioma;
  set nomeIdioma(String _value) {
    _nomeIdioma = _value;
  }

  bool _atualizaNivelIdioma = false;
  bool get atualizaNivelIdioma => _atualizaNivelIdioma;
  set atualizaNivelIdioma(bool _value) {
    _atualizaNivelIdioma = _value;
  }

  dynamic _escolaridadeColaborador = jsonDecode(
      '{\"instituicao\":\"HARVARD\",\"areaEstudo\":\"DESIGN THINKING\",\"descricao\":\"MBA\",\"dataInicio\":\"2015-01-01T00:00:00\",\"dataTermino\":\"2016-12-31\",\"tipoDiplomaId\":\"1\",\"colaboradorCpf\":\"05525153963\"}');
  dynamic get escolaridadeColaborador => _escolaridadeColaborador;
  set escolaridadeColaborador(dynamic _value) {
    _escolaridadeColaborador = _value;
  }

  String _escolaridadeArea = '';
  String get escolaridadeArea => _escolaridadeArea;
  set escolaridadeArea(String _value) {
    _escolaridadeArea = _value;
  }

  String _escolaridadeEmissor = '';
  String get escolaridadeEmissor => _escolaridadeEmissor;
  set escolaridadeEmissor(String _value) {
    _escolaridadeEmissor = _value;
  }

  String _escolaridadeInicio = '';
  String get escolaridadeInicio => _escolaridadeInicio;
  set escolaridadeInicio(String _value) {
    _escolaridadeInicio = _value;
  }

  String _escolaridadeConclusao = '';
  String get escolaridadeConclusao => _escolaridadeConclusao;
  set escolaridadeConclusao(String _value) {
    _escolaridadeConclusao = _value;
  }

  String _escolaridadeArquivo = '';
  String get escolaridadeArquivo => _escolaridadeArquivo;
  set escolaridadeArquivo(String _value) {
    _escolaridadeArquivo = _value;
  }

  String _escolaridadeNivel = '';
  String get escolaridadeNivel => _escolaridadeNivel;
  set escolaridadeNivel(String _value) {
    _escolaridadeNivel = _value;
  }

  bool _escolaridadePDF = false;
  bool get escolaridadePDF => _escolaridadePDF;
  set escolaridadePDF(bool _value) {
    _escolaridadePDF = _value;
  }

  dynamic _projectDetails;
  dynamic get projectDetails => _projectDetails;
  set projectDetails(dynamic _value) {
    _projectDetails = _value;
  }

  List<dynamic> _myProjectsTodos = [];
  List<dynamic> get myProjectsTodos => _myProjectsTodos;
  set myProjectsTodos(List<dynamic> _value) {
    _myProjectsTodos = _value;
  }

  void addToMyProjectsTodos(dynamic _value) {
    _myProjectsTodos.add(_value);
  }

  void removeFromMyProjectsTodos(dynamic _value) {
    _myProjectsTodos.remove(_value);
  }

  void removeAtIndexFromMyProjectsTodos(int _index) {
    _myProjectsTodos.removeAt(_index);
  }

  void updateMyProjectsTodosAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _myProjectsTodos[_index] = updateFn(_myProjectsTodos[_index]);
  }

  List<dynamic> _alocadosEmpresaJSON = [];
  List<dynamic> get alocadosEmpresaJSON => _alocadosEmpresaJSON;
  set alocadosEmpresaJSON(List<dynamic> _value) {
    _alocadosEmpresaJSON = _value;
  }

  void addToAlocadosEmpresaJSON(dynamic _value) {
    _alocadosEmpresaJSON.add(_value);
  }

  void removeFromAlocadosEmpresaJSON(dynamic _value) {
    _alocadosEmpresaJSON.remove(_value);
  }

  void removeAtIndexFromAlocadosEmpresaJSON(int _index) {
    _alocadosEmpresaJSON.removeAt(_index);
  }

  void updateAlocadosEmpresaJSONAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _alocadosEmpresaJSON[_index] = updateFn(_alocadosEmpresaJSON[_index]);
  }

  List<dynamic> _alocadosEmpresasTodosJSON = [];
  List<dynamic> get alocadosEmpresasTodosJSON => _alocadosEmpresasTodosJSON;
  set alocadosEmpresasTodosJSON(List<dynamic> _value) {
    _alocadosEmpresasTodosJSON = _value;
  }

  void addToAlocadosEmpresasTodosJSON(dynamic _value) {
    _alocadosEmpresasTodosJSON.add(_value);
  }

  void removeFromAlocadosEmpresasTodosJSON(dynamic _value) {
    _alocadosEmpresasTodosJSON.remove(_value);
  }

  void removeAtIndexFromAlocadosEmpresasTodosJSON(int _index) {
    _alocadosEmpresasTodosJSON.removeAt(_index);
  }

  void updateAlocadosEmpresasTodosJSONAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _alocadosEmpresasTodosJSON[_index] =
        updateFn(_alocadosEmpresasTodosJSON[_index]);
  }

  List<dynamic> _HardSkillsCertificatesJSON = [];
  List<dynamic> get HardSkillsCertificatesJSON => _HardSkillsCertificatesJSON;
  set HardSkillsCertificatesJSON(List<dynamic> _value) {
    _HardSkillsCertificatesJSON = _value;
  }

  void addToHardSkillsCertificatesJSON(dynamic _value) {
    _HardSkillsCertificatesJSON.add(_value);
  }

  void removeFromHardSkillsCertificatesJSON(dynamic _value) {
    _HardSkillsCertificatesJSON.remove(_value);
  }

  void removeAtIndexFromHardSkillsCertificatesJSON(int _index) {
    _HardSkillsCertificatesJSON.removeAt(_index);
  }

  void updateHardSkillsCertificatesJSONAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _HardSkillsCertificatesJSON[_index] =
        updateFn(_HardSkillsCertificatesJSON[_index]);
  }

  String _instituicaoEscolaridade = '';
  String get instituicaoEscolaridade => _instituicaoEscolaridade;
  set instituicaoEscolaridade(String _value) {
    _instituicaoEscolaridade = _value;
  }

  String _myPCD = 'Nenhuma';
  String get myPCD => _myPCD;
  set myPCD(String _value) {
    _myPCD = _value;
  }

  bool _myCovidBool = false;
  bool get myCovidBool => _myCovidBool;
  set myCovidBool(bool _value) {
    _myCovidBool = _value;
  }

  bool _photoNova = false;
  bool get photoNova => _photoNova;
  set photoNova(bool _value) {
    _photoNova = _value;
  }

  int _myCovidInt = 0;
  int get myCovidInt => _myCovidInt;
  set myCovidInt(int _value) {
    _myCovidInt = _value;
  }

  int _escolaridadeId = 0;
  int get escolaridadeId => _escolaridadeId;
  set escolaridadeId(int _value) {
    _escolaridadeId = _value;
  }

  dynamic _meusBeneficios = jsonDecode(
      '[{\"id\":1,\"created_at\":1678977803945,\"name\":\"Conquer+\",\"category\":\"Educação\",\"description\":\"Desconto de 10% em qualquer curso da plataforma\",\"is_active\":true,\"comerciais\":[1],\"interessados\":[6,18,5,7],\"img_icon\":{\"path\":\"/vault/Vshw0i8_/8KBZtniwnzuHnk80Zb2exLrwlFk/Hj-5JQ../conquer_icon.png\",\"name\":\"conquer_icon.png\",\"type\":\"image\",\"size\":203051,\"mime\":\"image/png\",\"meta\":{\"width\":934,\"height\":934},\"url\":\"https://xare-axod-hky2.b2.xano.io/vault/Vshw0i8_/8KBZtniwnzuHnk80Zb2exLrwlFk/Hj-5JQ../conquer_icon.png\"},\"img_product\":{\"path\":\"/vault/Vshw0i8_/CJwcCujs6kVXNd4LEbMFNo3rOhI/60VCQA../conquer_product.png\",\"name\":\"conquer_product.png\",\"type\":\"image\",\"size\":13768,\"mime\":\"image/png\",\"meta\":{\"width\":1200,\"height\":628},\"url\":\"https://xare-axod-hky2.b2.xano.io/vault/Vshw0i8_/CJwcCujs6kVXNd4LEbMFNo3rOhI/60VCQA../conquer_product.png\"},\"faq\":[{\"question\":\"O desconto serve para qualquer curso na plataforma?\",\"answer\":\"Sim!\"},{\"question\":\"Posso compartilhar login com outras pessoas?\",\"answer\":\"Não!\"},{\"question\":\"Nova pergunta\",\"answer\":\"Nova resposta\"}]},{\"id\":2,\"created_at\":1672605933,\"name\":\"Zé Delivery\",\"category\":\"Alimentação\",\"description\":\"Frete grátis\",\"is_active\":true,\"comerciais\":[1],\"interessados\":[6,18,5,7],\"img_icon\":{\"path\":\"/vault/Vshw0i8_/8KBZtniwnzuHnk80Zb2exLrwlFk/Hj-5JQ../conquer_icon.png\",\"name\":\"conquer_icon.png\",\"type\":\"image\",\"size\":203051,\"mime\":\"image/png\",\"meta\":{\"width\":934,\"height\":934},\"url\":\"https://xare-axod-hky2.b2.xano.io/vault/Vshw0i8_/8KBZtniwnzuHnk80Zb2exLrwlFk/Hj-5JQ../conquer_icon.png\"},\"img_product\":{\"path\":\"/vault/Vshw0i8_/CJwcCujs6kVXNd4LEbMFNo3rOhI/60VCQA../conquer_product.png\",\"name\":\"conquer_product.png\",\"type\":\"image\",\"size\":13768,\"mime\":\"image/png\",\"meta\":{\"width\":1200,\"height\":628},\"url\":\"https://xare-axod-hky2.b2.xano.io/vault/Vshw0i8_/CJwcCujs6kVXNd4LEbMFNo3rOhI/60VCQA../conquer_product.png\"},\"faq\":[{\"question\":\"O desconto serve para qualquer curso na plataforma?\",\"answer\":\"Sim!\"},{\"question\":\"Posso compartilhar login com outras pessoas?\",\"answer\":\"Não!\"},{\"question\":\"Nova pergunta\",\"answer\":\"Nova resposta\"}]}]');
  dynamic get meusBeneficios => _meusBeneficios;
  set meusBeneficios(dynamic _value) {
    _meusBeneficios = _value;
  }

  bool _emHomolog = false;
  bool get emHomolog => _emHomolog;
  set emHomolog(bool _value) {
    _emHomolog = _value;
  }

  String _tokenPJ = '';
  String get tokenPJ => _tokenPJ;
  set tokenPJ(String _value) {
    _tokenPJ = _value;
    prefs.setString('ff_tokenPJ', _value);
  }

  dynamic _showMePJData;
  dynamic get showMePJData => _showMePJData;
  set showMePJData(dynamic _value) {
    _showMePJData = _value;
    prefs.setString('ff_showMePJData', jsonEncode(_value));
  }

  String _myCV = 'Sem informação';
  String get myCV => _myCV;
  set myCV(String _value) {
    _myCV = _value;
  }

  String _tokenEmpresa = '';
  String get tokenEmpresa => _tokenEmpresa;
  set tokenEmpresa(String _value) {
    _tokenEmpresa = _value;
    prefs.setString('ff_tokenEmpresa', _value);
  }

  dynamic _showMeDataEmpresa;
  dynamic get showMeDataEmpresa => _showMeDataEmpresa;
  set showMeDataEmpresa(dynamic _value) {
    _showMeDataEmpresa = _value;
    prefs.setString('ff_showMeDataEmpresa', jsonEncode(_value));
  }

  List<dynamic> _apontamentosEmpresaJSON = [];
  List<dynamic> get apontamentosEmpresaJSON => _apontamentosEmpresaJSON;
  set apontamentosEmpresaJSON(List<dynamic> _value) {
    _apontamentosEmpresaJSON = _value;
  }

  void addToApontamentosEmpresaJSON(dynamic _value) {
    _apontamentosEmpresaJSON.add(_value);
  }

  void removeFromApontamentosEmpresaJSON(dynamic _value) {
    _apontamentosEmpresaJSON.remove(_value);
  }

  void removeAtIndexFromApontamentosEmpresaJSON(int _index) {
    _apontamentosEmpresaJSON.removeAt(_index);
  }

  void updateApontamentosEmpresaJSONAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _apontamentosEmpresaJSON[_index] =
        updateFn(_apontamentosEmpresaJSON[_index]);
  }

  List<dynamic> _apontamentosEmpresaJSONTodos = [];
  List<dynamic> get apontamentosEmpresaJSONTodos =>
      _apontamentosEmpresaJSONTodos;
  set apontamentosEmpresaJSONTodos(List<dynamic> _value) {
    _apontamentosEmpresaJSONTodos = _value;
  }

  void addToApontamentosEmpresaJSONTodos(dynamic _value) {
    _apontamentosEmpresaJSONTodos.add(_value);
  }

  void removeFromApontamentosEmpresaJSONTodos(dynamic _value) {
    _apontamentosEmpresaJSONTodos.remove(_value);
  }

  void removeAtIndexFromApontamentosEmpresaJSONTodos(int _index) {
    _apontamentosEmpresaJSONTodos.removeAt(_index);
  }

  void updateApontamentosEmpresaJSONTodosAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _apontamentosEmpresaJSONTodos[_index] =
        updateFn(_apontamentosEmpresaJSONTodos[_index]);
  }

  int _prestadorID = 0;
  int get prestadorID => _prestadorID;
  set prestadorID(int _value) {
    _prestadorID = _value;
    prefs.setInt('ff_prestadorID', _value);
  }

  dynamic _prestadorHoras;
  dynamic get prestadorHoras => _prestadorHoras;
  set prestadorHoras(dynamic _value) {
    _prestadorHoras = _value;
  }

  bool _sidebarPJOpen = true;
  bool get sidebarPJOpen => _sidebarPJOpen;
  set sidebarPJOpen(bool _value) {
    _sidebarPJOpen = _value;
    prefs.setBool('ff_sidebarPJOpen', _value);
  }

  bool _sidebarPJitem1Active = false;
  bool get sidebarPJitem1Active => _sidebarPJitem1Active;
  set sidebarPJitem1Active(bool _value) {
    _sidebarPJitem1Active = _value;
  }

  bool _sidebarPJitem2Active = false;
  bool get sidebarPJitem2Active => _sidebarPJitem2Active;
  set sidebarPJitem2Active(bool _value) {
    _sidebarPJitem2Active = _value;
  }

  bool _sidebarPJitem3Active = false;
  bool get sidebarPJitem3Active => _sidebarPJitem3Active;
  set sidebarPJitem3Active(bool _value) {
    _sidebarPJitem3Active = _value;
  }

  Color _sidebarPJbgActive = Color(4294923029);
  Color get sidebarPJbgActive => _sidebarPJbgActive;
  set sidebarPJbgActive(Color _value) {
    _sidebarPJbgActive = _value;
  }

  Color _sidebarPJtextActive = Color(4294967295);
  Color get sidebarPJtextActive => _sidebarPJtextActive;
  set sidebarPJtextActive(Color _value) {
    _sidebarPJtextActive = _value;
  }

  String _empresaID = '';
  String get empresaID => _empresaID;
  set empresaID(String _value) {
    _empresaID = _value;
    prefs.setString('ff_empresaID', _value);
  }

  double _coluna3 = 344;
  double get coluna3 => _coluna3;
  set coluna3(double _value) {
    _coluna3 = _value;
  }

  double _coluna6 = 160;
  double get coluna6 => _coluna6;
  set coluna6(double _value) {
    _coluna6 = _value;
  }

  double _coluna4 = 252;
  double get coluna4 => _coluna4;
  set coluna4(double _value) {
    _coluna4 = _value;
  }

  bool _sidebarCNPJOpen = true;
  bool get sidebarCNPJOpen => _sidebarCNPJOpen;
  set sidebarCNPJOpen(bool _value) {
    _sidebarCNPJOpen = _value;
    prefs.setBool('ff_sidebarCNPJOpen', _value);
  }

  bool _sidebarCNPJitem1Active = false;
  bool get sidebarCNPJitem1Active => _sidebarCNPJitem1Active;
  set sidebarCNPJitem1Active(bool _value) {
    _sidebarCNPJitem1Active = _value;
  }

  bool _sidebarCNPJitem2Active = false;
  bool get sidebarCNPJitem2Active => _sidebarCNPJitem2Active;
  set sidebarCNPJitem2Active(bool _value) {
    _sidebarCNPJitem2Active = _value;
  }

  bool _sidebarCNPJitem3Active = false;
  bool get sidebarCNPJitem3Active => _sidebarCNPJitem3Active;
  set sidebarCNPJitem3Active(bool _value) {
    _sidebarCNPJitem3Active = _value;
  }

  bool _sidebarCNPJitem4Active = false;
  bool get sidebarCNPJitem4Active => _sidebarCNPJitem4Active;
  set sidebarCNPJitem4Active(bool _value) {
    _sidebarCNPJitem4Active = _value;
  }

  List<dynamic> _aprovarHorasList = [];
  List<dynamic> get aprovarHorasList => _aprovarHorasList;
  set aprovarHorasList(List<dynamic> _value) {
    _aprovarHorasList = _value;
  }

  void addToAprovarHorasList(dynamic _value) {
    _aprovarHorasList.add(_value);
  }

  void removeFromAprovarHorasList(dynamic _value) {
    _aprovarHorasList.remove(_value);
  }

  void removeAtIndexFromAprovarHorasList(int _index) {
    _aprovarHorasList.removeAt(_index);
  }

  void updateAprovarHorasListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _aprovarHorasList[_index] = updateFn(_aprovarHorasList[_index]);
  }

  int _apontamentosEmpresaID = 0;
  int get apontamentosEmpresaID => _apontamentosEmpresaID;
  set apontamentosEmpresaID(int _value) {
    _apontamentosEmpresaID = _value;
  }

  int _apontamentosProjetoID = 0;
  int get apontamentosProjetoID => _apontamentosProjetoID;
  set apontamentosProjetoID(int _value) {
    _apontamentosProjetoID = _value;
  }

  String _apontamentoEmpresaID = '';
  String get apontamentoEmpresaID => _apontamentoEmpresaID;
  set apontamentoEmpresaID(String _value) {
    _apontamentoEmpresaID = _value;
  }

  String _apontamentoProjetoID = '';
  String get apontamentoProjetoID => _apontamentoProjetoID;
  set apontamentoProjetoID(String _value) {
    _apontamentoProjetoID = _value;
  }

  dynamic _minhasEmpresas;
  dynamic get minhasEmpresas => _minhasEmpresas;
  set minhasEmpresas(dynamic _value) {
    _minhasEmpresas = _value;
  }

  List<dynamic> _minhaEmpresa = [];
  List<dynamic> get minhaEmpresa => _minhaEmpresa;
  set minhaEmpresa(List<dynamic> _value) {
    _minhaEmpresa = _value;
  }

  void addToMinhaEmpresa(dynamic _value) {
    _minhaEmpresa.add(_value);
  }

  void removeFromMinhaEmpresa(dynamic _value) {
    _minhaEmpresa.remove(_value);
  }

  void removeAtIndexFromMinhaEmpresa(int _index) {
    _minhaEmpresa.removeAt(_index);
  }

  void updateMinhaEmpresaAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _minhaEmpresa[_index] = updateFn(_minhaEmpresa[_index]);
  }

  List<dynamic> _meuProjeto = [];
  List<dynamic> get meuProjeto => _meuProjeto;
  set meuProjeto(List<dynamic> _value) {
    _meuProjeto = _value;
  }

  void addToMeuProjeto(dynamic _value) {
    _meuProjeto.add(_value);
  }

  void removeFromMeuProjeto(dynamic _value) {
    _meuProjeto.remove(_value);
  }

  void removeAtIndexFromMeuProjeto(int _index) {
    _meuProjeto.removeAt(_index);
  }

  void updateMeuProjetoAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _meuProjeto[_index] = updateFn(_meuProjeto[_index]);
  }

  List<int> _minhaEmpresaID = [];
  List<int> get minhaEmpresaID => _minhaEmpresaID;
  set minhaEmpresaID(List<int> _value) {
    _minhaEmpresaID = _value;
  }

  void addToMinhaEmpresaID(int _value) {
    _minhaEmpresaID.add(_value);
  }

  void removeFromMinhaEmpresaID(int _value) {
    _minhaEmpresaID.remove(_value);
  }

  void removeAtIndexFromMinhaEmpresaID(int _index) {
    _minhaEmpresaID.removeAt(_index);
  }

  void updateMinhaEmpresaIDAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _minhaEmpresaID[_index] = updateFn(_minhaEmpresaID[_index]);
  }

  List<String> _minhaEmpresaName = [];
  List<String> get minhaEmpresaName => _minhaEmpresaName;
  set minhaEmpresaName(List<String> _value) {
    _minhaEmpresaName = _value;
  }

  void addToMinhaEmpresaName(String _value) {
    _minhaEmpresaName.add(_value);
  }

  void removeFromMinhaEmpresaName(String _value) {
    _minhaEmpresaName.remove(_value);
  }

  void removeAtIndexFromMinhaEmpresaName(int _index) {
    _minhaEmpresaName.removeAt(_index);
  }

  void updateMinhaEmpresaNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _minhaEmpresaName[_index] = updateFn(_minhaEmpresaName[_index]);
  }

  int _empresaSelecionada = 0;
  int get empresaSelecionada => _empresaSelecionada;
  set empresaSelecionada(int _value) {
    _empresaSelecionada = _value;
  }

  int _projetoSelecionado = 0;
  int get projetoSelecionado => _projetoSelecionado;
  set projetoSelecionado(int _value) {
    _projetoSelecionado = _value;
  }

  dynamic _meusProjetos;
  dynamic get meusProjetos => _meusProjetos;
  set meusProjetos(dynamic _value) {
    _meusProjetos = _value;
  }

  List<dynamic> _minhasHoras = [];
  List<dynamic> get minhasHoras => _minhasHoras;
  set minhasHoras(List<dynamic> _value) {
    _minhasHoras = _value;
  }

  void addToMinhasHoras(dynamic _value) {
    _minhasHoras.add(_value);
  }

  void removeFromMinhasHoras(dynamic _value) {
    _minhasHoras.remove(_value);
  }

  void removeAtIndexFromMinhasHoras(int _index) {
    _minhasHoras.removeAt(_index);
  }

  void updateMinhasHorasAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _minhasHoras[_index] = updateFn(_minhasHoras[_index]);
  }

  int _colabManager = 0;
  int get colabManager => _colabManager;
  set colabManager(int _value) {
    _colabManager = _value;
  }

  int _perfilAcesso = 0;
  int get perfilAcesso => _perfilAcesso;
  set perfilAcesso(int _value) {
    _perfilAcesso = _value;
    prefs.setInt('ff_perfilAcesso', _value);
  }

  bool _sidebarCNPJitem5Active = false;
  bool get sidebarCNPJitem5Active => _sidebarCNPJitem5Active;
  set sidebarCNPJitem5Active(bool _value) {
    _sidebarCNPJitem5Active = _value;
  }

  List<dynamic> _aprovarNotasList = [];
  List<dynamic> get aprovarNotasList => _aprovarNotasList;
  set aprovarNotasList(List<dynamic> _value) {
    _aprovarNotasList = _value;
  }

  void addToAprovarNotasList(dynamic _value) {
    _aprovarNotasList.add(_value);
  }

  void removeFromAprovarNotasList(dynamic _value) {
    _aprovarNotasList.remove(_value);
  }

  void removeAtIndexFromAprovarNotasList(int _index) {
    _aprovarNotasList.removeAt(_index);
  }

  void updateAprovarNotasListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _aprovarNotasList[_index] = updateFn(_aprovarNotasList[_index]);
  }

  List<dynamic> _notasFiscaisEmpresaJSONList = [];
  List<dynamic> get notasFiscaisEmpresaJSONList => _notasFiscaisEmpresaJSONList;
  set notasFiscaisEmpresaJSONList(List<dynamic> _value) {
    _notasFiscaisEmpresaJSONList = _value;
  }

  void addToNotasFiscaisEmpresaJSONList(dynamic _value) {
    _notasFiscaisEmpresaJSONList.add(_value);
  }

  void removeFromNotasFiscaisEmpresaJSONList(dynamic _value) {
    _notasFiscaisEmpresaJSONList.remove(_value);
  }

  void removeAtIndexFromNotasFiscaisEmpresaJSONList(int _index) {
    _notasFiscaisEmpresaJSONList.removeAt(_index);
  }

  void updateNotasFiscaisEmpresaJSONListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _notasFiscaisEmpresaJSONList[_index] =
        updateFn(_notasFiscaisEmpresaJSONList[_index]);
  }

  List<dynamic> _notasFiscaisEmpresaJSONListTodos = [];
  List<dynamic> get notasFiscaisEmpresaJSONListTodos =>
      _notasFiscaisEmpresaJSONListTodos;
  set notasFiscaisEmpresaJSONListTodos(List<dynamic> _value) {
    _notasFiscaisEmpresaJSONListTodos = _value;
  }

  void addToNotasFiscaisEmpresaJSONListTodos(dynamic _value) {
    _notasFiscaisEmpresaJSONListTodos.add(_value);
  }

  void removeFromNotasFiscaisEmpresaJSONListTodos(dynamic _value) {
    _notasFiscaisEmpresaJSONListTodos.remove(_value);
  }

  void removeAtIndexFromNotasFiscaisEmpresaJSONListTodos(int _index) {
    _notasFiscaisEmpresaJSONListTodos.removeAt(_index);
  }

  void updateNotasFiscaisEmpresaJSONListTodosAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _notasFiscaisEmpresaJSONListTodos[_index] =
        updateFn(_notasFiscaisEmpresaJSONListTodos[_index]);
  }

  dynamic _prestadorNotas;
  dynamic get prestadorNotas => _prestadorNotas;
  set prestadorNotas(dynamic _value) {
    _prestadorNotas = _value;
  }

  List<dynamic> _minhasNotas = [];
  List<dynamic> get minhasNotas => _minhasNotas;
  set minhasNotas(List<dynamic> _value) {
    _minhasNotas = _value;
  }

  void addToMinhasNotas(dynamic _value) {
    _minhasNotas.add(_value);
  }

  void removeFromMinhasNotas(dynamic _value) {
    _minhasNotas.remove(_value);
  }

  void removeAtIndexFromMinhasNotas(int _index) {
    _minhasNotas.removeAt(_index);
  }

  void updateMinhasNotasAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _minhasNotas[_index] = updateFn(_minhasNotas[_index]);
  }

  double _colunaModal = 750;
  double get colunaModal => _colunaModal;
  set colunaModal(double _value) {
    _colunaModal = _value;
  }

  double _colunaMain = 1440;
  double get colunaMain => _colunaMain;
  set colunaMain(double _value) {
    _colunaMain = _value;
  }

  int _correnteNotaIf = 0;
  int get correnteNotaIf => _correnteNotaIf;
  set correnteNotaIf(int _value) {
    _correnteNotaIf = _value;
  }

  String _myName = 'Sem informação';
  String get myName => _myName;
  set myName(String _value) {
    _myName = _value;
  }

  String _myCEP = 'Sem informação';
  String get myCEP => _myCEP;
  set myCEP(String _value) {
    _myCEP = _value;
  }

  String _MyRg = 'Sem informação';
  String get MyRg => _MyRg;
  set MyRg(String _value) {
    _MyRg = _value;
  }

  String _myCity = 'Sem informação';
  String get myCity => _myCity;
  set myCity(String _value) {
    _myCity = _value;
  }

  String _myEmail = 'Sem informação';
  String get myEmail => _myEmail;
  set myEmail(String _value) {
    _myEmail = _value;
  }

  String _myPassaporte = 'Sem informação';
  String get myPassaporte => _myPassaporte;
  set myPassaporte(String _value) {
    _myPassaporte = _value;
  }

  int _managerID = 0;
  int get managerID => _managerID;
  set managerID(int _value) {
    _managerID = _value;
  }

  String _authToken = '';
  String get authToken => _authToken;
  set authToken(String _value) {
    _authToken = _value;
  }

  String _myAddress = 'Sem informação';
  String get myAddress => _myAddress;
  set myAddress(String _value) {
    _myAddress = _value;
  }

  List<dynamic> _pagamentosEmpresaJSON = [];
  List<dynamic> get pagamentosEmpresaJSON => _pagamentosEmpresaJSON;
  set pagamentosEmpresaJSON(List<dynamic> _value) {
    _pagamentosEmpresaJSON = _value;
  }

  void addToPagamentosEmpresaJSON(dynamic _value) {
    _pagamentosEmpresaJSON.add(_value);
  }

  void removeFromPagamentosEmpresaJSON(dynamic _value) {
    _pagamentosEmpresaJSON.remove(_value);
  }

  void removeAtIndexFromPagamentosEmpresaJSON(int _index) {
    _pagamentosEmpresaJSON.removeAt(_index);
  }

  void updatePagamentosEmpresaJSONAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _pagamentosEmpresaJSON[_index] = updateFn(_pagamentosEmpresaJSON[_index]);
  }

  List<dynamic> _pagamentosEmpresaJSONTodos = [];
  List<dynamic> get pagamentosEmpresaJSONTodos => _pagamentosEmpresaJSONTodos;
  set pagamentosEmpresaJSONTodos(List<dynamic> _value) {
    _pagamentosEmpresaJSONTodos = _value;
  }

  void addToPagamentosEmpresaJSONTodos(dynamic _value) {
    _pagamentosEmpresaJSONTodos.add(_value);
  }

  void removeFromPagamentosEmpresaJSONTodos(dynamic _value) {
    _pagamentosEmpresaJSONTodos.remove(_value);
  }

  void removeAtIndexFromPagamentosEmpresaJSONTodos(int _index) {
    _pagamentosEmpresaJSONTodos.removeAt(_index);
  }

  void updatePagamentosEmpresaJSONTodosAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _pagamentosEmpresaJSONTodos[_index] =
        updateFn(_pagamentosEmpresaJSONTodos[_index]);
  }

  dynamic _forcaPerfil;
  dynamic get forcaPerfil => _forcaPerfil;
  set forcaPerfil(dynamic _value) {
    _forcaPerfil = _value;
  }

  double _forcaPerfil1 = 0.0;
  double get forcaPerfil1 => _forcaPerfil1;
  set forcaPerfil1(double _value) {
    _forcaPerfil1 = _value;
  }

  double _forcaPerfil2 = 0.0;
  double get forcaPerfil2 => _forcaPerfil2;
  set forcaPerfil2(double _value) {
    _forcaPerfil2 = _value;
  }

  double _forcaPerfil3 = 0.0;
  double get forcaPerfil3 => _forcaPerfil3;
  set forcaPerfil3(double _value) {
    _forcaPerfil3 = _value;
  }

  bool _userTemPhoto = false;
  bool get userTemPhoto => _userTemPhoto;
  set userTemPhoto(bool _value) {
    _userTemPhoto = _value;
  }

  List<dynamic> _allTicketsColabJSON = [];
  List<dynamic> get allTicketsColabJSON => _allTicketsColabJSON;
  set allTicketsColabJSON(List<dynamic> _value) {
    _allTicketsColabJSON = _value;
  }

  void addToAllTicketsColabJSON(dynamic _value) {
    _allTicketsColabJSON.add(_value);
  }

  void removeFromAllTicketsColabJSON(dynamic _value) {
    _allTicketsColabJSON.remove(_value);
  }

  void removeAtIndexFromAllTicketsColabJSON(int _index) {
    _allTicketsColabJSON.removeAt(_index);
  }

  void updateAllTicketsColabJSONAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _allTicketsColabJSON[_index] = updateFn(_allTicketsColabJSON[_index]);
  }

  List<dynamic> _allTicketsConcluidosColabJSON = [];
  List<dynamic> get allTicketsConcluidosColabJSON =>
      _allTicketsConcluidosColabJSON;
  set allTicketsConcluidosColabJSON(List<dynamic> _value) {
    _allTicketsConcluidosColabJSON = _value;
  }

  void addToAllTicketsConcluidosColabJSON(dynamic _value) {
    _allTicketsConcluidosColabJSON.add(_value);
  }

  void removeFromAllTicketsConcluidosColabJSON(dynamic _value) {
    _allTicketsConcluidosColabJSON.remove(_value);
  }

  void removeAtIndexFromAllTicketsConcluidosColabJSON(int _index) {
    _allTicketsConcluidosColabJSON.removeAt(_index);
  }

  void updateAllTicketsConcluidosColabJSONAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _allTicketsConcluidosColabJSON[_index] =
        updateFn(_allTicketsConcluidosColabJSON[_index]);
  }

  String _token = '';
  String get token => _token;
  set token(String _value) {
    _token = _value;
    prefs.setString('ff_token', _value);
  }

  String _myPhoto = '';
  String get myPhoto => _myPhoto;
  set myPhoto(String _value) {
    _myPhoto = _value;
    prefs.setString('ff_myPhoto', _value);
  }

  String _myNamePJ = '';
  String get myNamePJ => _myNamePJ;
  set myNamePJ(String _value) {
    _myNamePJ = _value;
  }

  String _myEmailPJ = '';
  String get myEmailPJ => _myEmailPJ;
  set myEmailPJ(String _value) {
    _myEmailPJ = _value;
  }

  String _myCPFPJ = '';
  String get myCPFPJ => _myCPFPJ;
  set myCPFPJ(String _value) {
    _myCPFPJ = _value;
  }

  List<dynamic> _bookColaboradorSalariosJSON = [];
  List<dynamic> get bookColaboradorSalariosJSON => _bookColaboradorSalariosJSON;
  set bookColaboradorSalariosJSON(List<dynamic> _value) {
    _bookColaboradorSalariosJSON = _value;
  }

  void addToBookColaboradorSalariosJSON(dynamic _value) {
    _bookColaboradorSalariosJSON.add(_value);
  }

  void removeFromBookColaboradorSalariosJSON(dynamic _value) {
    _bookColaboradorSalariosJSON.remove(_value);
  }

  void removeAtIndexFromBookColaboradorSalariosJSON(int _index) {
    _bookColaboradorSalariosJSON.removeAt(_index);
  }

  void updateBookColaboradorSalariosJSONAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _bookColaboradorSalariosJSON[_index] =
        updateFn(_bookColaboradorSalariosJSON[_index]);
  }

  List<dynamic> _bookColaboradorAusenciasJSON = [];
  List<dynamic> get bookColaboradorAusenciasJSON =>
      _bookColaboradorAusenciasJSON;
  set bookColaboradorAusenciasJSON(List<dynamic> _value) {
    _bookColaboradorAusenciasJSON = _value;
  }

  void addToBookColaboradorAusenciasJSON(dynamic _value) {
    _bookColaboradorAusenciasJSON.add(_value);
  }

  void removeFromBookColaboradorAusenciasJSON(dynamic _value) {
    _bookColaboradorAusenciasJSON.remove(_value);
  }

  void removeAtIndexFromBookColaboradorAusenciasJSON(int _index) {
    _bookColaboradorAusenciasJSON.removeAt(_index);
  }

  void updateBookColaboradorAusenciasJSONAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _bookColaboradorAusenciasJSON[_index] =
        updateFn(_bookColaboradorAusenciasJSON[_index]);
  }

  List<dynamic> _dadosCompartilhados = [];
  List<dynamic> get dadosCompartilhados => _dadosCompartilhados;
  set dadosCompartilhados(List<dynamic> _value) {
    _dadosCompartilhados = _value;
  }

  void addToDadosCompartilhados(dynamic _value) {
    _dadosCompartilhados.add(_value);
  }

  void removeFromDadosCompartilhados(dynamic _value) {
    _dadosCompartilhados.remove(_value);
  }

  void removeAtIndexFromDadosCompartilhados(int _index) {
    _dadosCompartilhados.removeAt(_index);
  }

  void updateDadosCompartilhadosAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _dadosCompartilhados[_index] = updateFn(_dadosCompartilhados[_index]);
  }

  bool _isManager = false;
  bool get isManager => _isManager;
  set isManager(bool _value) {
    _isManager = _value;
    prefs.setBool('ff_isManager', _value);
  }

  List<dynamic> _bookColaboradorAcompanhamentosJSON = [];
  List<dynamic> get bookColaboradorAcompanhamentosJSON =>
      _bookColaboradorAcompanhamentosJSON;
  set bookColaboradorAcompanhamentosJSON(List<dynamic> _value) {
    _bookColaboradorAcompanhamentosJSON = _value;
  }

  void addToBookColaboradorAcompanhamentosJSON(dynamic _value) {
    _bookColaboradorAcompanhamentosJSON.add(_value);
  }

  void removeFromBookColaboradorAcompanhamentosJSON(dynamic _value) {
    _bookColaboradorAcompanhamentosJSON.remove(_value);
  }

  void removeAtIndexFromBookColaboradorAcompanhamentosJSON(int _index) {
    _bookColaboradorAcompanhamentosJSON.removeAt(_index);
  }

  void updateBookColaboradorAcompanhamentosJSONAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _bookColaboradorAcompanhamentosJSON[_index] =
        updateFn(_bookColaboradorAcompanhamentosJSON[_index]);
  }

  String _myManager = '';
  String get myManager => _myManager;
  set myManager(String _value) {
    _myManager = _value;
  }

  bool _sidebarPJitem4Active = false;
  bool get sidebarPJitem4Active => _sidebarPJitem4Active;
  set sidebarPJitem4Active(bool _value) {
    _sidebarPJitem4Active = _value;
  }

  bool _sidebarPJitem5Active = false;
  bool get sidebarPJitem5Active => _sidebarPJitem5Active;
  set sidebarPJitem5Active(bool _value) {
    _sidebarPJitem5Active = _value;
  }

  dynamic _dadosColab;
  dynamic get dadosColab => _dadosColab;
  set dadosColab(dynamic _value) {
    _dadosColab = _value;
    prefs.setString('ff_dadosColab', jsonEncode(_value));
  }

  dynamic _userData;
  dynamic get userData => _userData;
  set userData(dynamic _value) {
    _userData = _value;
    prefs.setString('ff_userData', jsonEncode(_value));
  }

  String _projetoSelecionadoName = '';
  String get projetoSelecionadoName => _projetoSelecionadoName;
  set projetoSelecionadoName(String _value) {
    _projetoSelecionadoName = _value;
  }

  List<dynamic> _hierarquiaListJSON = [];
  List<dynamic> get hierarquiaListJSON => _hierarquiaListJSON;
  set hierarquiaListJSON(List<dynamic> _value) {
    _hierarquiaListJSON = _value;
  }

  void addToHierarquiaListJSON(dynamic _value) {
    _hierarquiaListJSON.add(_value);
  }

  void removeFromHierarquiaListJSON(dynamic _value) {
    _hierarquiaListJSON.remove(_value);
  }

  void removeAtIndexFromHierarquiaListJSON(int _index) {
    _hierarquiaListJSON.removeAt(_index);
  }

  void updateHierarquiaListJSONAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _hierarquiaListJSON[_index] = updateFn(_hierarquiaListJSON[_index]);
  }

  String _cofinsParam = '';
  String get cofinsParam => _cofinsParam;
  set cofinsParam(String _value) {
    _cofinsParam = _value;
  }

  String _pisParam = '';
  String get pisParam => _pisParam;
  set pisParam(String _value) {
    _pisParam = _value;
  }

  String _socialParam = '';
  String get socialParam => _socialParam;
  set socialParam(String _value) {
    _socialParam = _value;
  }

  String _irffParam = '';
  String get irffParam => _irffParam;
  set irffParam(String _value) {
    _irffParam = _value;
  }

  dynamic _minhaAlocacao;
  dynamic get minhaAlocacao => _minhaAlocacao;
  set minhaAlocacao(dynamic _value) {
    _minhaAlocacao = _value;
  }

  String _modalidadeSelecionada = '';
  String get modalidadeSelecionada => _modalidadeSelecionada;
  set modalidadeSelecionada(String _value) {
    _modalidadeSelecionada = _value;
  }

  String _valorSelecionado = '';
  String get valorSelecionado => _valorSelecionado;
  set valorSelecionado(String _value) {
    _valorSelecionado = _value;
  }

  bool _sidebarCNPJitem6Active = false;
  bool get sidebarCNPJitem6Active => _sidebarCNPJitem6Active;
  set sidebarCNPJitem6Active(bool _value) {
    _sidebarCNPJitem6Active = _value;
  }

  bool _sidebarCNPJitem7Active = false;
  bool get sidebarCNPJitem7Active => _sidebarCNPJitem7Active;
  set sidebarCNPJitem7Active(bool _value) {
    _sidebarCNPJitem7Active = _value;
  }

  bool _sidebarCNPJitem8Active = false;
  bool get sidebarCNPJitem8Active => _sidebarCNPJitem8Active;
  set sidebarCNPJitem8Active(bool _value) {
    _sidebarCNPJitem8Active = _value;
  }

  bool _sidebarCNPJitem9Active = false;
  bool get sidebarCNPJitem9Active => _sidebarCNPJitem9Active;
  set sidebarCNPJitem9Active(bool _value) {
    _sidebarCNPJitem9Active = _value;
  }

  bool _sidebarCNPJitem10Active = false;
  bool get sidebarCNPJitem10Active => _sidebarCNPJitem10Active;
  set sidebarCNPJitem10Active(bool _value) {
    _sidebarCNPJitem10Active = _value;
  }

  bool _sidebarPJitem6Active = false;
  bool get sidebarPJitem6Active => _sidebarPJitem6Active;
  set sidebarPJitem6Active(bool _value) {
    _sidebarPJitem6Active = _value;
  }

  bool _sidebarPJitem7Active = false;
  bool get sidebarPJitem7Active => _sidebarPJitem7Active;
  set sidebarPJitem7Active(bool _value) {
    _sidebarPJitem7Active = _value;
  }

  bool _sidebarPJitem8Active = false;
  bool get sidebarPJitem8Active => _sidebarPJitem8Active;
  set sidebarPJitem8Active(bool _value) {
    _sidebarPJitem8Active = _value;
  }

  List<dynamic> _periodoFeriasJSONList = [];
  List<dynamic> get periodoFeriasJSONList => _periodoFeriasJSONList;
  set periodoFeriasJSONList(List<dynamic> _value) {
    _periodoFeriasJSONList = _value;
  }

  void addToPeriodoFeriasJSONList(dynamic _value) {
    _periodoFeriasJSONList.add(_value);
  }

  void removeFromPeriodoFeriasJSONList(dynamic _value) {
    _periodoFeriasJSONList.remove(_value);
  }

  void removeAtIndexFromPeriodoFeriasJSONList(int _index) {
    _periodoFeriasJSONList.removeAt(_index);
  }

  void updatePeriodoFeriasJSONListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _periodoFeriasJSONList[_index] = updateFn(_periodoFeriasJSONList[_index]);
  }

  dynamic _faqBeneficio =
      jsonDecode('[{\"question\":\"questao 1\",\"answer\":\"resposta 1\"}]');
  dynamic get faqBeneficio => _faqBeneficio;
  set faqBeneficio(dynamic _value) {
    _faqBeneficio = _value;
  }

  dynamic _novoBeneficio;
  dynamic get novoBeneficio => _novoBeneficio;
  set novoBeneficio(dynamic _value) {
    _novoBeneficio = _value;
  }

  dynamic _testeTiago;
  dynamic get testeTiago => _testeTiago;
  set testeTiago(dynamic _value) {
    _testeTiago = _value;
  }

  String _tabMapa = 'trimestral';
  String get tabMapa => _tabMapa;
  set tabMapa(String _value) {
    _tabMapa = _value;
  }

  String _tabMapaProjeto = 'alocacoes';
  String get tabMapaProjeto => _tabMapaProjeto;
  set tabMapaProjeto(String _value) {
    _tabMapaProjeto = _value;
  }

  String _tabMapaColaborador = 'alocacoes';
  String get tabMapaColaborador => _tabMapaColaborador;
  set tabMapaColaborador(String _value) {
    _tabMapaColaborador = _value;
  }

  String _tabMapaColabsubaba = 'dadospessoais';
  String get tabMapaColabsubaba => _tabMapaColabsubaba;
  set tabMapaColabsubaba(String _value) {
    _tabMapaColabsubaba = _value;
  }

  dynamic _editBeneficio;
  dynamic get editBeneficio => _editBeneficio;
  set editBeneficio(dynamic _value) {
    _editBeneficio = _value;
  }

  List<dynamic> _empresaJSON = [];
  List<dynamic> get empresaJSON => _empresaJSON;
  set empresaJSON(List<dynamic> _value) {
    _empresaJSON = _value;
  }

  void addToEmpresaJSON(dynamic _value) {
    _empresaJSON.add(_value);
  }

  void removeFromEmpresaJSON(dynamic _value) {
    _empresaJSON.remove(_value);
  }

  void removeAtIndexFromEmpresaJSON(int _index) {
    _empresaJSON.removeAt(_index);
  }

  void updateEmpresaJSONAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _empresaJSON[_index] = updateFn(_empresaJSON[_index]);
  }

  double _taxaRelatorio = 0.0;
  double get taxaRelatorio => _taxaRelatorio;
  set taxaRelatorio(double _value) {
    _taxaRelatorio = _value;
  }

  double _valorTaxaRelatorio = 0.0;
  double get valorTaxaRelatorio => _valorTaxaRelatorio;
  set valorTaxaRelatorio(double _value) {
    _valorTaxaRelatorio = _value;
  }

  double _valorTotalTaxaRelatorio = 0.0;
  double get valorTotalTaxaRelatorio => _valorTotalTaxaRelatorio;
  set valorTotalTaxaRelatorio(double _value) {
    _valorTotalTaxaRelatorio = _value;
  }

  String _MyCpf = 'Sem informação';
  String get MyCpf => _MyCpf;
  set MyCpf(String _value) {
    _MyCpf = _value;
    prefs.setString('ff_MyCpf', _value);
  }

  bool _sidebarCNPJitem11Active = false;
  bool get sidebarCNPJitem11Active => _sidebarCNPJitem11Active;
  set sidebarCNPJitem11Active(bool _value) {
    _sidebarCNPJitem11Active = _value;
  }

  List<dynamic> _okrOrganizacaoOKR = [];
  List<dynamic> get okrOrganizacaoOKR => _okrOrganizacaoOKR;
  set okrOrganizacaoOKR(List<dynamic> _value) {
    _okrOrganizacaoOKR = _value;
  }

  void addToOkrOrganizacaoOKR(dynamic _value) {
    _okrOrganizacaoOKR.add(_value);
  }

  void removeFromOkrOrganizacaoOKR(dynamic _value) {
    _okrOrganizacaoOKR.remove(_value);
  }

  void removeAtIndexFromOkrOrganizacaoOKR(int _index) {
    _okrOrganizacaoOKR.removeAt(_index);
  }

  void updateOkrOrganizacaoOKRAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _okrOrganizacaoOKR[_index] = updateFn(_okrOrganizacaoOKR[_index]);
  }

  List<dynamic> _okrOrganizacaoObjetivoArea = [];
  List<dynamic> get okrOrganizacaoObjetivoArea => _okrOrganizacaoObjetivoArea;
  set okrOrganizacaoObjetivoArea(List<dynamic> _value) {
    _okrOrganizacaoObjetivoArea = _value;
  }

  void addToOkrOrganizacaoObjetivoArea(dynamic _value) {
    _okrOrganizacaoObjetivoArea.add(_value);
  }

  void removeFromOkrOrganizacaoObjetivoArea(dynamic _value) {
    _okrOrganizacaoObjetivoArea.remove(_value);
  }

  void removeAtIndexFromOkrOrganizacaoObjetivoArea(int _index) {
    _okrOrganizacaoObjetivoArea.removeAt(_index);
  }

  void updateOkrOrganizacaoObjetivoAreaAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _okrOrganizacaoObjetivoArea[_index] =
        updateFn(_okrOrganizacaoObjetivoArea[_index]);
  }

  List<dynamic> _okrAreaObjetivoArea = [];
  List<dynamic> get okrAreaObjetivoArea => _okrAreaObjetivoArea;
  set okrAreaObjetivoArea(List<dynamic> _value) {
    _okrAreaObjetivoArea = _value;
  }

  void addToOkrAreaObjetivoArea(dynamic _value) {
    _okrAreaObjetivoArea.add(_value);
  }

  void removeFromOkrAreaObjetivoArea(dynamic _value) {
    _okrAreaObjetivoArea.remove(_value);
  }

  void removeAtIndexFromOkrAreaObjetivoArea(int _index) {
    _okrAreaObjetivoArea.removeAt(_index);
  }

  void updateOkrAreaObjetivoAreaAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _okrAreaObjetivoArea[_index] = updateFn(_okrAreaObjetivoArea[_index]);
  }

  List<dynamic> _okrAreaResultadoChave = [];
  List<dynamic> get okrAreaResultadoChave => _okrAreaResultadoChave;
  set okrAreaResultadoChave(List<dynamic> _value) {
    _okrAreaResultadoChave = _value;
  }

  void addToOkrAreaResultadoChave(dynamic _value) {
    _okrAreaResultadoChave.add(_value);
  }

  void removeFromOkrAreaResultadoChave(dynamic _value) {
    _okrAreaResultadoChave.remove(_value);
  }

  void removeAtIndexFromOkrAreaResultadoChave(int _index) {
    _okrAreaResultadoChave.removeAt(_index);
  }

  void updateOkrAreaResultadoChaveAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _okrAreaResultadoChave[_index] = updateFn(_okrAreaResultadoChave[_index]);
  }

  List<dynamic> _mapaVisita = [];
  List<dynamic> get mapaVisita => _mapaVisita;
  set mapaVisita(List<dynamic> _value) {
    _mapaVisita = _value;
  }

  void addToMapaVisita(dynamic _value) {
    _mapaVisita.add(_value);
  }

  void removeFromMapaVisita(dynamic _value) {
    _mapaVisita.remove(_value);
  }

  void removeAtIndexFromMapaVisita(int _index) {
    _mapaVisita.removeAt(_index);
  }

  void updateMapaVisitaAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _mapaVisita[_index] = updateFn(_mapaVisita[_index]);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
