import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ptText = '',
    String? enText = '',
  }) =>
      [ptText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'bpu175q4': {
      'pt': 'BookTracker',
      'en': '',
    },
    'pwrydm1k': {
      'pt': 'Home',
      'en': '',
    },
  },
  // library
  {
    'a11rnfz6': {
      'pt': 'BookTracker',
      'en': '',
    },
    'x1lap47b': {
      'pt': 'Livros lidos:',
      'en': '',
    },
    't9d4g37w': {
      'pt': 'Livros em andamento:',
      'en': '',
    },
    '61qgl5p9': {
      'pt': 'Leituras futuras:',
      'en': '',
    },
    '6zcgx0vm': {
      'pt': 'Biblioteca',
      'en': '',
    },
  },
  // form_books
  {
    'pruz2cve': {
      'pt': 'Cadastro de livros',
      'en': '',
    },
    '5ier2gr4': {
      'pt': 'Titulo do livro',
      'en': '',
    },
    'i544xhsx': {
      'pt': 'Nome do autor',
      'en': '',
    },
    '9h3f9mu8': {
      'pt': 'Quantidade de paginas',
      'en': '',
    },
    'zaxwf7vi': {
      'pt': 'Quantidade de capitulos',
      'en': '',
    },
    '7li3n76c': {
      'pt': 'Descrição/Sinopse',
      'en': '',
    },
    'zv4fxuqb': {
      'pt': 'Rastear por:',
      'en': '',
    },
    'i3onjv5s': {
      'pt': 'Capitulos',
      'en': '',
    },
    'lsczorag': {
      'pt': 'Capitulos',
      'en': '',
    },
    'qfydc60s': {
      'pt': 'Páginas',
      'en': '',
    },
    '28ypc83n': {
      'pt': 'Como será a sua meta:',
      'en': '',
    },
    'q40qyvvw': {
      'pt': 'Capitulos diários',
      'en': '',
    },
    'zcnnk5c0': {
      'pt': 'Capitulos diários',
      'en': '',
    },
    'ezalul50': {
      'pt': 'Meta de data final',
      'en': '',
    },
    'gfkbuusw': {
      'pt': 'Quantidade de capitulos diários',
      'en': '',
    },
    'kx9o4dlh': {
      'pt': 'Capitulos',
      'en': '',
    },
    'jwjk7mly': {
      'pt': 'Adicionar a uma lista',
      'en': '',
    },
    'ge47vx0f': {
      'pt': 'Adicionar a uma lista',
      'en': '',
    },
    'd3gd18l7': {
      'pt': '5',
      'en': '',
    },
    'ydueeq79': {
      'pt': '10',
      'en': '',
    },
    'u0x7799m': {
      'pt': '15',
      'en': '',
    },
    'gv1fqhjt': {
      'pt': '20',
      'en': '',
    },
    'uwd4g9x6': {
      'pt': 'Adicionar a uma lista',
      'en': '',
    },
    'r725lluu': {
      'pt': 'Pesquisar listas',
      'en': '',
    },
    '77ysti24': {
      'pt': 'Mais opções',
      'en': '',
    },
    '6qn1nhzb': {
      'pt': 'Fisico',
      'en': '',
    },
    '326dc7dy': {
      'pt': 'Fisico',
      'en': '',
    },
    'mnfzscwy': {
      'pt': 'Digital',
      'en': '',
    },
    'io290n16': {
      'pt': 'Tags',
      'en': '',
    },
    '9he93bxk': {
      'pt': 'Editora',
      'en': '',
    },
    'wqgbif1y': {
      'pt': 'ISBN-10',
      'en': '',
    },
    '3v15j0v6': {
      'pt': 'ISBN-13',
      'en': '',
    },
    'n9q7jg1g': {
      'pt': 'Edição',
      'en': '',
    },
    'ym4tqvty': {
      'pt': 'Idioma',
      'en': '',
    },
    'agzii4bm': {
      'pt': 'Data de publicação',
      'en': '',
    },
    '7hzfgcuf': {
      'pt': 'Salvar',
      'en': '',
    },
    '4w3z7ngm': {
      'pt': 'Preencha o campo corretamente',
      'en': '',
    },
    'pga5zl7l': {
      'pt': 'Preencha o campo corretamente',
      'en': '',
    },
    'd77fb2kh': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    '3uw819xx': {
      'pt': 'Preencha o campo corretamente',
      'en': '',
    },
    'ukblr4lz': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'kjtwvfll': {
      'pt': 'Preencha o campo corretamente',
      'en': '',
    },
    '9ttri4gh': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'f54ei9u9': {
      'pt': 'Field is required',
      'en': '',
    },
    'z8yok2do': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ufl8pbec': {
      'pt': 'Field is required',
      'en': '',
    },
    'jdy52lm8': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    '0klvdaky': {
      'pt': 'Field is required',
      'en': '',
    },
    '9rapht1z': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'yojzbpg6': {
      'pt': 'Field is required',
      'en': '',
    },
    'kuq9lroi': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    't8e68242': {
      'pt': 'Field is required',
      'en': '',
    },
    'jgjvh7v4': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'acrcx7bo': {
      'pt': 'Field is required',
      'en': '',
    },
    '3nhs6i15': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'v43j82vs': {
      'pt': 'Field is required',
      'en': '',
    },
    'awbyoz7w': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'pvr0l8ua': {
      'pt': 'Field is required',
      'en': '',
    },
    '37efy3fk': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ct301val': {
      'pt': 'Field is required',
      'en': '',
    },
    'i6upq5td': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'vb3kvzg3': {
      'pt': 'Field is required',
      'en': '',
    },
    'n45no51a': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    '5o1welew': {
      'pt': 'Home',
      'en': '',
    },
  },
  // profile
  {
    '413wnva8': {
      'pt': 'David Jerome',
      'en': '',
    },
    'bofg4451': {
      'pt': 'Estatísticas',
      'en': '',
    },
    '78ytpa9x': {
      'pt': 'Páginas lidas',
      'en': '',
    },
    'o2c5hpo2': {
      'pt': ': ',
      'en': '',
    },
    '2o8g655p': {
      'pt': 'Capitulos lidos',
      'en': '',
    },
    'hlvrgww3': {
      'pt': ': ',
      'en': '',
    },
    '1d8pt7u7': {
      'pt': 'Media paginas/dia',
      'en': '',
    },
    'dgciqhoj': {
      'pt': ': ',
      'en': '',
    },
    'lt32rzse': {
      'pt': 'Livros lidos',
      'en': '',
    },
    'ariwtx3g': {
      'pt': ':',
      'en': '',
    },
    'n9jng2xc': {
      'pt': 'Livros em andamento',
      'en': '',
    },
    'dith7d7g': {
      'pt': ':',
      'en': '',
    },
    'ncgak3nr': {
      'pt': 'Livros futuros',
      'en': '',
    },
    'r06t168z': {
      'pt': ':',
      'en': '',
    },
    'pv570ssk': {
      'pt': 'Livros totais',
      'en': '',
    },
    'l4d66jx5': {
      'pt': ':',
      'en': '',
    },
    'g13l78x1': {
      'pt': '2197',
      'en': '',
    },
    '7g52e8hd': {
      'pt': '699',
      'en': '',
    },
    'dfcljljx': {
      'pt': '20.2',
      'en': '',
    },
    'ko4kzlcd': {
      'pt': '33',
      'en': '',
    },
    'xuwbwpgz': {
      'pt': '2',
      'en': '',
    },
    'nuq4g8hw': {
      'pt': '20',
      'en': '',
    },
    '4maa8uku': {
      'pt': '55',
      'en': '',
    },
    'g9aviulm': {
      'pt': 'Livro mais curto lido',
      'en': '',
    },
    'ogi4yhj0': {
      'pt': ':',
      'en': '',
    },
    'lbfmj37k': {
      'pt': 'O Hobbit',
      'en': '',
    },
    'fqi30f66': {
      'pt': 'Páginas: 200',
      'en': '',
    },
    'rkdiw74d': {
      'pt': 'Livro mais longo lido',
      'en': '',
    },
    '6uq0ecae': {
      'pt': ':',
      'en': '',
    },
    'fjwzn9vs': {
      'pt': 'O Hobbit',
      'en': '',
    },
    'jdpuijs0': {
      'pt': 'Páginas: 500',
      'en': '',
    },
    '4npyoah8': {
      'pt': 'Leituras na ultima ',
      'en': '',
    },
    'pr6fcuc6': {
      'pt': 'semana:',
      'en': '',
    },
    '46q2wish': {
      'pt': 'semana:',
      'en': '',
    },
    'xn53nd3k': {
      'pt': 'mês:',
      'en': '',
    },
    'hba6cyg0': {
      'pt': 'inicio do ano:',
      'en': '',
    },
    '65j8xvnp': {
      'pt': 'ultimos 12 mêses:',
      'en': '',
    },
    'ecih2zij': {
      'pt': 'sempre:',
      'en': '',
    },
    'jmal2n94': {
      'pt': 'Search for an item...',
      'en': '',
    },
    'macippdi': {
      'pt': 'Paginas',
      'en': '',
    },
    '3h4r82pt': {
      'pt': 'Paginas lidas',
      'en': '',
    },
    'ho48kunu': {
      'pt': ':',
      'en': '',
    },
    'hjdkaqrd': {
      'pt': 'Capitulos lidas',
      'en': '',
    },
    'cyh6jwmi': {
      'pt': ':',
      'en': '',
    },
    'h631kckg': {
      'pt': 'Medias paginas/dia',
      'en': '',
    },
    'bkuvd2ze': {
      'pt': ':',
      'en': '',
    },
    '8d8gteqo': {
      'pt': '100',
      'en': '',
    },
    'mk2djnfq': {
      'pt': ' 5',
      'en': '',
    },
    '9garx0j3': {
      'pt': '19.9',
      'en': '',
    },
    'ftflamms': {
      'pt': 'Perfil',
      'en': '',
    },
    '6ywctqw6': {
      'pt': 'Home',
      'en': '',
    },
  },
  // book_info
  {
    'rdgtooan': {
      'pt': 'Livro',
      'en': '',
    },
    'v48i94jp': {
      'pt': 'O Hobbit',
      'en': '',
    },
    'u1g4qeib': {
      'pt': 'Autor',
      'en': '',
    },
    'trfv924u': {
      'pt': ':',
      'en': '',
    },
    'mvmtc5h6': {
      'pt': 'Páginas',
      'en': '',
    },
    '8w66i8k2': {
      'pt': ':',
      'en': '',
    },
    'gtuj94er': {
      'pt': 'Capitulos',
      'en': '',
    },
    'bcr072xq': {
      'pt': ':',
      'en': '',
    },
    'r146dbdk': {
      'pt': 'Início',
      'en': '',
    },
    'a2yiqlgj': {
      'pt': ':',
      'en': '',
    },
    'yzatmtad': {
      'pt': 'Fim',
      'en': '',
    },
    'adiaebk6': {
      'pt': ':',
      'en': '',
    },
    '1e10y7qv': {
      'pt': 'J. R. R. Tolkien',
      'en': '',
    },
    'wqqtgqok': {
      'pt': '336',
      'en': '',
    },
    'yk8oaqdu': {
      'pt': '21',
      'en': '',
    },
    '51ni53g3': {
      'pt': '09/03/2023',
      'en': '',
    },
    'l1e668cq': {
      'pt': '29/07/2023',
      'en': '',
    },
    'c00plrpm': {
      'pt': '100%',
      'en': '',
    },
    '8wvqso7g': {
      'pt': 'Sinopse:',
      'en': '',
    },
    '5dbmbihk': {
      'pt': 'Data de lançamento',
      'en': '',
    },
    'o9eqouo7': {
      'pt': ':',
      'en': '',
    },
    '5qawz2by': {
      'pt': '21 de setembro de 1937',
      'en': '',
    },
    '4c6dqvla': {
      'pt': 'Informações da edição',
      'en': '',
    },
    'dthhcbrz': {
      'pt': 'Editora',
      'en': '',
    },
    'epfmhln3': {
      'pt': ':',
      'en': '',
    },
    'k4xb6fcw': {
      'pt': 'Publicação',
      'en': '',
    },
    '6dbvq99v': {
      'pt': ':',
      'en': '',
    },
    '7o55oyjz': {
      'pt': 'Idioma',
      'en': '',
    },
    'n85v60f2': {
      'pt': ':',
      'en': '',
    },
    'kv1knnsl': {
      'pt': 'ISBN-10',
      'en': '',
    },
    'yxm7vs48': {
      'pt': ':',
      'en': '',
    },
    'wi1oiswf': {
      'pt': 'ISBN-13',
      'en': '',
    },
    '9ng0g5ot': {
      'pt': ':',
      'en': '',
    },
    'ocd54ej6': {
      'pt': 'HarperCollins Brasil',
      'en': '',
    },
    'aaat9tj2': {
      'pt': '15 de junho de 2019',
      'en': '',
    },
    's8ww1on3': {
      'pt': 'Português',
      'en': '',
    },
    'b1xuynz8': {
      'pt': '9788595085800',
      'en': '',
    },
    '2iu1lzv3': {
      'pt': '8595085803',
      'en': '',
    },
    'mh0l22mt': {
      'pt': 'Tags',
      'en': '',
    },
    '1kdbzclh': {
      'pt': ':',
      'en': '',
    },
    'oct7z8wk': {
      'pt': 'Aventura',
      'en': '',
    },
    '5g5z179w': {
      'pt': 'Fantasia',
      'en': '',
    },
    'h5w9p6vt': {
      'pt': 'Romance',
      'en': '',
    },
    'qewsl3gx': {
      'pt': 'Épico',
      'en': '',
    },
    'ow0vo51q': {
      'pt': 'Tipo de livro',
      'en': '',
    },
    'py7u4fao': {
      'pt': ':',
      'en': '',
    },
    'okijuhyp': {
      'pt': 'Físico',
      'en': '',
    },
    'wsssaihc': {
      'pt': 'Home',
      'en': '',
    },
  },
  // notifications
  {
    'earczt1r': {
      'pt': 'Notificações',
      'en': '',
    },
    'nd3q1rjo': {
      'pt': 'Horário',
      'en': '',
    },
    'e6m6t9ne': {
      'pt': '12',
      'en': '',
    },
    '6nalyz22': {
      'pt': '00',
      'en': '',
    },
    'd3y1jyms': {
      'pt': '01',
      'en': '',
    },
    'm85o06fk': {
      'pt': '02',
      'en': '',
    },
    'vvnxdrr4': {
      'pt': '03',
      'en': '',
    },
    '0ec7uyfg': {
      'pt': '04',
      'en': '',
    },
    'ho35hbex': {
      'pt': '05',
      'en': '',
    },
    'vmm4nmha': {
      'pt': '06',
      'en': '',
    },
    '6kqwkcfd': {
      'pt': '07',
      'en': '',
    },
    'ekwbk0z5': {
      'pt': '08',
      'en': '',
    },
    '7e55kfzb': {
      'pt': '09',
      'en': '',
    },
    'dmsr3gqc': {
      'pt': '10',
      'en': '',
    },
    'qqqf0nvm': {
      'pt': '11',
      'en': '',
    },
    'hws31jaz': {
      'pt': '12',
      'en': '',
    },
    '0tg6gtsg': {
      'pt': '13',
      'en': '',
    },
    'gjsxzu3v': {
      'pt': '14',
      'en': '',
    },
    '6dwmvq1e': {
      'pt': '15',
      'en': '',
    },
    'phk05bdq': {
      'pt': '16',
      'en': '',
    },
    'skhljcx5': {
      'pt': '17',
      'en': '',
    },
    '91jckd1a': {
      'pt': '18',
      'en': '',
    },
    'ko49e1f2': {
      'pt': '19',
      'en': '',
    },
    'g35s8pal': {
      'pt': '20',
      'en': '',
    },
    '4ivqqd6z': {
      'pt': '21',
      'en': '',
    },
    '7i6r4yiz': {
      'pt': '22',
      'en': '',
    },
    'e5a7q05z': {
      'pt': '23',
      'en': '',
    },
    '897mgtsu': {
      'pt': '',
      'en': '',
    },
    's2hw7wr8': {
      'pt': 'Search for an item...',
      'en': '',
    },
    '1twghrc3': {
      'pt': ':',
      'en': '',
    },
    'fafciv57': {
      'pt': '00',
      'en': '',
    },
    '0vkf4m54': {
      'pt': '00',
      'en': '',
    },
    '1kqj4pn2': {
      'pt': '05',
      'en': '',
    },
    'tb36i82y': {
      'pt': '10',
      'en': '',
    },
    'vpmia4fi': {
      'pt': '15',
      'en': '',
    },
    '9ep4jy1z': {
      'pt': '20',
      'en': '',
    },
    'mfmst4hr': {
      'pt': '25',
      'en': '',
    },
    'a40abh3m': {
      'pt': '30',
      'en': '',
    },
    'ycwk95gu': {
      'pt': '35',
      'en': '',
    },
    '33t03k2i': {
      'pt': '40',
      'en': '',
    },
    'bqphqgzo': {
      'pt': '45',
      'en': '',
    },
    '1ts0adi8': {
      'pt': '50',
      'en': '',
    },
    'l45ksnge': {
      'pt': '55',
      'en': '',
    },
    '05cfdw15': {
      'pt': '',
      'en': '',
    },
    '7i28c131': {
      'pt': 'Search for an item...',
      'en': '',
    },
    '26uy9eae': {
      'pt': 'Notificações',
      'en': '',
    },
    '17ujdopl': {
      'pt': 'Home',
      'en': '',
    },
  },
  // nav_menu
  {
    'hqcquqbj': {
      'pt': 'Livros em andamento',
      'en': '',
    },
    'g5ftuv7q': {
      'pt': 'Biblioteca',
      'en': '',
    },
  },
  // reading_in_progress
  {
    'n2s6ch4f': {
      'pt': 'O Hobbit',
      'en': '',
    },
    'yvwtdusi': {
      'pt': 'Data de Inicio:',
      'en': '',
    },
    'mf0eoy7m': {
      'pt': 'Previsão de fim:',
      'en': '',
    },
    'zhbmy26f': {
      'pt': '29/08/2023',
      'en': '',
    },
    'jt3fzaj2': {
      'pt': '29/09/2023',
      'en': '',
    },
    '9f1cltdd': {
      'pt': '50 paginas de 100',
      'en': '',
    },
    'ulmc3z5s': {
      'pt': 'Lançar',
      'en': '',
    },
  },
  // readingDone
  {
    '4jw9giop': {
      'pt': 'O Hobbit',
      'en': '',
    },
    'wbrinb71': {
      'pt': 'Data de Inicio:',
      'en': '',
    },
    '3ab4zfak': {
      'pt': 'Data de fim:',
      'en': '',
    },
    'b4i5k27o': {
      'pt': '29/08/2023',
      'en': '',
    },
    'pc6pkoe2': {
      'pt': '29/09/2023',
      'en': '',
    },
    't33z9px7': {
      'pt': '100 paginas de 100',
      'en': '',
    },
  },
  // readingFuture
  {
    'lby6ard3': {
      'pt': 'O Hobbit',
      'en': '',
    },
    '964nkhzw': {
      'pt': 'Data de Inicio:',
      'en': '',
    },
    'tbc06mca': {
      'pt': 'Data de fim:',
      'en': '',
    },
    'zxjnzd36': {
      'pt': '29/08/2023',
      'en': '',
    },
    '87xx5ed8': {
      'pt': '29/09/2023',
      'en': '',
    },
    'lmxwteim': {
      'pt': '20 capitulos de 20',
      'en': '',
    },
    'pzxa7fwt': {
      'pt': 'Iniciar',
      'en': '',
    },
  },
  // drawer
  {
    'dju86pxg': {
      'pt': 'Minhas estatísticas',
      'en': '',
    },
    'ta9ffkji': {
      'pt': 'Notificações',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'jp9ptrcx': {
      'pt': '',
      'en': '',
    },
    'gxm7qiti': {
      'pt': '',
      'en': '',
    },
    '0f3999kt': {
      'pt': '',
      'en': '',
    },
    'qd78hgg0': {
      'pt': '',
      'en': '',
    },
    'wa034vpm': {
      'pt': '',
      'en': '',
    },
    'yucpaeqo': {
      'pt': '',
      'en': '',
    },
    'v8j8clqw': {
      'pt': '',
      'en': '',
    },
    'iqyggvo8': {
      'pt': '',
      'en': '',
    },
    'k2dcmgo5': {
      'pt': '',
      'en': '',
    },
    'fzjbzeqj': {
      'pt': '',
      'en': '',
    },
    'lbbj7aj7': {
      'pt': '',
      'en': '',
    },
    'expvvvp4': {
      'pt': '',
      'en': '',
    },
    'fq8iek15': {
      'pt': '',
      'en': '',
    },
    '05gv08so': {
      'pt': '',
      'en': '',
    },
    'jzxyc11j': {
      'pt': '',
      'en': '',
    },
    '8cg7duve': {
      'pt': '',
      'en': '',
    },
    's46rbz69': {
      'pt': '',
      'en': '',
    },
    'd8f63fw2': {
      'pt': '',
      'en': '',
    },
    'ugd2gg0i': {
      'pt': '',
      'en': '',
    },
    'kzcv1xec': {
      'pt': '',
      'en': '',
    },
    'oa8leoto': {
      'pt': '',
      'en': '',
    },
    'w5odmwx1': {
      'pt': '',
      'en': '',
    },
    'f56m33q0': {
      'pt': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
