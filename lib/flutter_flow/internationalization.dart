import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'vi'];

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
    String? enText = '',
    String? viText = '',
  }) =>
      [enText, viText][languageIndex] ?? '';

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
  // Login
  {
    '9tovlrkj': {
      'en': 'Welcome Back!',
      'vi': '',
    },
    'bwola2pe': {
      'en': 'Use the form below to access your account.',
      'vi': '',
    },
    'd61t7qda': {
      'en': 'Email Address',
      'vi': '',
    },
    'o446xxnu': {
      'en': 'Enter your email here...',
      'vi': '',
    },
    'offgqclb': {
      'en': 'Password',
      'vi': '',
    },
    'swpbkzw1': {
      'en': 'Enter your password here...',
      'vi': '',
    },
    'o5q8emtb': {
      'en': 'Forgot Password?',
      'vi': '',
    },
    '134d2ghi': {
      'en': 'Login',
      'vi': '',
    },
    'gai6ppag': {
      'en': 'Use a social platform to continue',
      'vi': '',
    },
    'tiv1a5w0': {
      'en': 'Don\'t have an account?',
      'vi': '',
    },
    '23s5n6ps': {
      'en': 'Create Account',
      'vi': '',
    },
    'vwtk3c8t': {
      'en': 'Home',
      'vi': '',
    },
  },
  // createAccount
  {
    '053034fl': {
      'en': 'Get Started',
      'vi': '',
    },
    '3x4kug8w': {
      'en': 'Use the form below to get started.',
      'vi': '',
    },
    'ql226vsf': {
      'en': 'Email Address',
      'vi': '',
    },
    'hicgsv2n': {
      'en': 'Enter your email here...',
      'vi': '',
    },
    '7kl0bhuq': {
      'en': 'Password',
      'vi': '',
    },
    'niycdw6b': {
      'en': 'Enter your email here...',
      'vi': '',
    },
    '0einfcrl': {
      'en': 'Confirm Password',
      'vi': '',
    },
    'ea8h2740': {
      'en': 'Enter your email here...',
      'vi': '',
    },
    'eg9itt74': {
      'en': 'Create Account',
      'vi': '',
    },
    'rjedse3a': {
      'en': 'Use a social platform to continue',
      'vi': '',
    },
    'rr3tpsni': {
      'en': 'Already have an account?',
      'vi': '',
    },
    'vtoqt1l2': {
      'en': 'Log In',
      'vi': '',
    },
    'f0zi248d': {
      'en': 'Home',
      'vi': '',
    },
  },
  // forgotPassword
  {
    'la8dafn2': {
      'en': 'Forgot Password',
      'vi': '',
    },
    '2fpon1hd': {
      'en':
          'Don\'t remember your password? Enter the email associated with your account below and we will send you a new link.',
      'vi': '',
    },
    'b3gpn17c': {
      'en': 'Email Address',
      'vi': '',
    },
    '686fmj97': {
      'en': 'Please enter a valid email...',
      'vi': '',
    },
    'jbgvvtke': {
      'en': 'Send Reset Link',
      'vi': '',
    },
    'v0a445b2': {
      'en': 'Home',
      'vi': '',
    },
  },
  // Home
  {
    '2ajp647r': {
      'en': 'Trung tâm điều khiển',
      'vi': '',
    },
    '5rqb2iw5': {
      'en': 'Bên dưới là toàn bộ thông tin và dữ liệu của trung tâm',
      'vi': '',
    },
    'l0hc40ec': {
      'en': 'Số lượng học viên',
      'vi': '',
    },
    'lre6rdv7': {
      'en': '24',
      'vi': '',
    },
    'dp4xwa5z': {
      'en': 'Số lượng giáo viên',
      'vi': '',
    },
    'hn9rrhzi': {
      'en': '3,200',
      'vi': '',
    },
    'c556deyt': {
      'en': 'Số lượng giáo viên đã kích hoạt',
      'vi': '',
    },
    'kxkp8lkh': {
      'en': '4300',
      'vi': '',
    },
    '2bvymd96': {
      'en': 'Projects',
      'vi': '',
    },
    'szguldne': {
      'en': 'UI Design Team',
      'vi': '',
    },
    '1agkp7y5': {
      'en': '4 Members',
      'vi': '',
    },
    'f6bj4tw5': {
      'en': 'Contract Activity',
      'vi': '',
    },
    'xme4gwoy': {
      'en': 'Below is an a summary of activity.',
      'vi': '',
    },
    '37gpdy6o': {
      'en': 'Customer Activity',
      'vi': '',
    },
    '3r1yigsg': {
      'en': 'Below is an a summary of activity.',
      'vi': '',
    },
    'd2s1adwm': {
      'en': 'Contract Activity',
      'vi': '',
    },
    'lqxwqll7': {
      'en': 'Below is an a summary of activity.',
      'vi': '',
    },
    '9f793wqp': {
      'en': 'Customer Activity',
      'vi': '',
    },
    'tz604db1': {
      'en': 'Below is an a summary of activity.',
      'vi': '',
    },
    '0e243mhj': {
      'en': 'Dashboard',
      'vi': '',
    },
    'mlg01kw6': {
      'en': '__',
      'vi': '',
    },
  },
  // Main_customerList
  {
    'jnw9wsw5': {
      'en': 'Danh sách học viên',
      'vi': '',
    },
    'e09a9dad': {
      'en': 'Tất cả học viên',
      'vi': '',
    },
    'bmn6sx24': {
      'en': 'Randy Alcorn',
      'vi': '',
    },
    '7pyqbqug': {
      'en': 'Head of Procurement',
      'vi': '',
    },
    'ha3up7pp': {
      'en': 'ACME Co.',
      'vi': '',
    },
    'phzb2tmw': {
      'en': 'James Wiseman',
      'vi': '',
    },
    'tf3eb9fo': {
      'en': 'Account Manager',
      'vi': '',
    },
    'i8kv28ac': {
      'en': 'ACME Co.',
      'vi': '',
    },
    'q2pdpn5v': {
      'en': 'Ignacious Rodriguez',
      'vi': '',
    },
    '2uvuw5bq': {
      'en': 'Sales Manager',
      'vi': '',
    },
    'xps59rvy': {
      'en': 'Robin HQ',
      'vi': '',
    },
    '5t1p7vle': {
      'en': 'Elena Williams',
      'vi': '',
    },
    'juofn8xa': {
      'en': 'Head of Product & Innovation',
      'vi': '',
    },
    's1a0tsjg': {
      'en': 'Robin HQ',
      'vi': '',
    },
    '936r5j7z': {
      'en': 'Greg Brown',
      'vi': '',
    },
    'pa0yuztf': {
      'en': 'Account Manager',
      'vi': '',
    },
    'n5jhcdt8': {
      'en': 'Robin HQ',
      'vi': '',
    },
    '0zrbcir3': {
      'en': 'June Williamson',
      'vi': '',
    },
    '2xwa0u77': {
      'en': 'Sr. Account Manager',
      'vi': '',
    },
    '74qz9zh0': {
      'en': 'HealthAi',
      'vi': '',
    },
    'gmi7j1fe': {
      'en': 'June Williamson',
      'vi': '',
    },
    'rr08nqgz': {
      'en': 'Sr. Account Manager',
      'vi': '',
    },
    'jlajp88t': {
      'en': 'HealthAi',
      'vi': '',
    },
    'nkdqulm8': {
      'en': 'Danh sách học viên đã kích hoạt',
      'vi': '',
    },
    'rwv5fdfj': {
      'en': 'June Williamson',
      'vi': '',
    },
    '68d2i3jn': {
      'en': 'Sr. Account Manager',
      'vi': '',
    },
    '4846zaq7': {
      'en': 'HealthAi',
      'vi': '',
    },
    'j4dhjd8f': {
      'en': 'James Wiseman',
      'vi': '',
    },
    '8el2z2bm': {
      'en': 'Account Manager',
      'vi': '',
    },
    'mvsid86e': {
      'en': 'HealthAi',
      'vi': '',
    },
    'pj4c8j09': {
      'en': 'Danh sách học viên chưa kích hoạt',
      'vi': '',
    },
    'zd7fjnc5': {
      'en': 'Randy Alcorn',
      'vi': '',
    },
    'fqxy140e': {
      'en': 'Head of Procurement',
      'vi': '',
    },
    'tpbntdjf': {
      'en': 'ACME Co.',
      'vi': '',
    },
    '7mbverpv': {
      'en': 'Elena Williams',
      'vi': '',
    },
    'jtyi3kuk': {
      'en': 'Head of Product & Innovation',
      'vi': '',
    },
    '3n0o92v1': {
      'en': 'Robin HQ',
      'vi': '',
    },
    'wrbglrsl': {
      'en': 'Customers',
      'vi': '',
    },
    'tsu41wgg': {
      'en': '__',
      'vi': '',
    },
  },
  // Main_Contracts
  {
    'ttff478h': {
      'en': 'Contracts',
      'vi': '',
    },
    '7miih7xf': {
      'en': 'Contracts',
      'vi': '',
    },
    '8uqpw5y0': {
      'en': 'Projects',
      'vi': '',
    },
    'x36512on': {
      'en': 'No-Code Platform Design',
      'vi': '',
    },
    'g013rbw0': {
      'en': 'Design Team Docs',
      'vi': '',
    },
    'o2i72mw9': {
      'en': 'Contracts',
      'vi': '',
    },
    'n94j9pc6': {
      'en': 'ACME Co.',
      'vi': '',
    },
    'sdrep8zr': {
      'en': 'Contracts for New Opportunities',
      'vi': '',
    },
    'jvpcrweb': {
      'en': 'Next Action',
      'vi': '',
    },
    'ad6qy3o7': {
      'en': 'Tuesday, 10:00am',
      'vi': '',
    },
    'tvvsskqu': {
      'en': 'In Progress',
      'vi': '',
    },
    '31uisx3y': {
      'en': 'HealthAi',
      'vi': '',
    },
    '54wjwstj': {
      'en': 'Client Acquisition for Q3',
      'vi': '',
    },
    'envqgymu': {
      'en': 'Next Action',
      'vi': '',
    },
    'v0mqmkz1': {
      'en': 'Tuesday, 10:00am',
      'vi': '',
    },
    'bxxz09rb': {
      'en': 'In Progress',
      'vi': '',
    },
    '69sucl8g': {
      'en': '__',
      'vi': '',
    },
  },
  // myTeam
  {
    '4bdfaizz': {
      'en': 'My Team',
      'vi': '',
    },
    'kgao7f6u': {
      'en': 'Search for your customers...',
      'vi': '',
    },
    'lrk6k6hj': {
      'en': 'Member Name',
      'vi': '',
    },
    'kzjhrn2i': {
      'en': 'Email',
      'vi': '',
    },
    'a9enpacl': {
      'en': 'Last Active',
      'vi': '',
    },
    '61ncdfm4': {
      'en': 'Date Created',
      'vi': '',
    },
    'dlz67f5g': {
      'en': 'Status',
      'vi': '',
    },
    'k4jg7anl': {
      'en': 'Alex Smith',
      'vi': '',
    },
    'dzqtdcoi': {
      'en': 'user@domainname.com',
      'vi': '',
    },
    '5txnz3rb': {
      'en': 'user@domain.com',
      'vi': '',
    },
    'rcibqtwp': {
      'en': 'Status',
      'vi': '',
    },
    'b8ete3l3': {
      'en': 'Andrea Rudolph',
      'vi': '',
    },
    'ki7ytulb': {
      'en': 'user@domainname.com',
      'vi': '',
    },
    'ydefib1a': {
      'en': 'user@domain.com',
      'vi': '',
    },
    'bmfpu9mf': {
      'en': 'Status',
      'vi': '',
    },
    '4qo20h5e': {
      'en': 'Andrea Rudolph',
      'vi': '',
    },
    'ghnpaxu0': {
      'en': 'user@domainname.com',
      'vi': '',
    },
    'vxaro41r': {
      'en': 'user@domain.com',
      'vi': '',
    },
    'xd1ep9pw': {
      'en': 'Status',
      'vi': '',
    },
    'zzg272jj': {
      'en': 'Andrea Rudolph',
      'vi': '',
    },
    '5ez0t6p9': {
      'en': 'user@domainname.com',
      'vi': '',
    },
    'mrvy41sm': {
      'en': 'user@domain.com',
      'vi': '',
    },
    'o81ig0ls': {
      'en': 'Status',
      'vi': '',
    },
    'ovp8geoc': {
      'en': 'Andrea Rudolph',
      'vi': '',
    },
    'obzet7a3': {
      'en': 'user@domainname.com',
      'vi': '',
    },
    'gczjqd8o': {
      'en': 'user@domain.com',
      'vi': '',
    },
    '8krhnjoh': {
      'en': 'Status',
      'vi': '',
    },
    'g2pzcyj7': {
      'en': 'Andrea Rudolph',
      'vi': '',
    },
    'jjkd1bmr': {
      'en': 'user@domainname.com',
      'vi': '',
    },
    'n3cb9gih': {
      'en': 'user@domain.com',
      'vi': '',
    },
    'n09lz2hc': {
      'en': 'Status',
      'vi': '',
    },
    '02kynj8q': {
      'en': 'Dashboard',
      'vi': '',
    },
    'p3buwlts': {
      'en': '__',
      'vi': '',
    },
  },
  // Main_profilePage
  {
    'v7i4irqf': {
      'en': 'My Profile',
      'vi': '',
    },
    'sjqi2gc4': {
      'en': 'Switch to Dark Mode',
      'vi': '',
    },
    'fg9e61wk': {
      'en': 'Switch to Light Mode',
      'vi': '',
    },
    'awi143h4': {
      'en': 'Account Settings',
      'vi': '',
    },
    'w8zt2q2i': {
      'en': 'Change Password',
      'vi': '',
    },
    '560haomg': {
      'en': 'Edit Profile',
      'vi': '',
    },
    '01numxto': {
      'en': 'Log Out',
      'vi': '',
    },
    'x96fv5gx': {
      'en': '__',
      'vi': '',
    },
  },
  // userDetails
  {
    'o25lf8c6': {
      'en': 'Customer Name',
      'vi': '',
    },
    'hm6rud19': {
      'en': 'Randy Alcorn',
      'vi': '',
    },
    'qqa45q8j': {
      'en': 'High Profile',
      'vi': '',
    },
    'qeaj8cis': {
      'en': 'Title',
      'vi': '',
    },
    'tk907txg': {
      'en': 'Head of Procurement',
      'vi': '',
    },
    'tqa6rq4e': {
      'en': 'Company',
      'vi': '',
    },
    'o4ne4l9q': {
      'en': 'ACME Co.',
      'vi': '',
    },
    'ytp9wu76': {
      'en': 'Notes',
      'vi': '',
    },
    'vyes6qdl': {
      'en': 'Alexandria Smith',
      'vi': '',
    },
    '5onhrxan': {
      'en': '1m ago',
      'vi': '',
    },
    'mmn5erp8': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'vi': '',
    },
    'az7eyial': {
      'en': '8',
      'vi': '',
    },
    'b9al7n5c': {
      'en': 'Notes',
      'vi': '',
    },
    'fbqtn6w1': {
      'en': 'Randy Alcorn',
      'vi': '',
    },
    'hbinb29o': {
      'en':
          'I\'m not really sure about this section here aI think you should do soemthing cool!',
      'vi': '',
    },
    'oof02mic': {
      'en': 'a min ago',
      'vi': '',
    },
    'm8iau8y5': {
      'en': 'Generate Quote',
      'vi': '',
    },
    '19im2n6c': {
      'en': 'View Company',
      'vi': '',
    },
    '0j0z7y2l': {
      'en': 'Home',
      'vi': '',
    },
  },
  // projectDetailsHealthAi
  {
    'ou8nszs6': {
      'en': 'HealthAi',
      'vi': '',
    },
    'sm8n9htg': {
      'en': 'Client Acquisition for Q3',
      'vi': '',
    },
    'iutqo47f': {
      'en': 'Next Action',
      'vi': '',
    },
    '5008cvyy': {
      'en': 'Tuesday, 10:00am',
      'vi': '',
    },
    '6m10b6s1': {
      'en': 'In Progress',
      'vi': '',
    },
    'rzo41yaf': {
      'en': 'Contract Details',
      'vi': '',
    },
    'q6cl079q': {
      'en': '\$125,000',
      'vi': '',
    },
    'h7jn9sta': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'vi': '',
    },
    'lhyua4se': {
      'en': 'Mark as Complete',
      'vi': '',
    },
    'pa810reh': {
      'en': 'Contract Details',
      'vi': '',
    },
    'hukcne3v': {
      'en': '\$67,000',
      'vi': '',
    },
    'ktznj1tk': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'vi': '',
    },
    'ceheqo7i': {
      'en': 'Mark as Complete',
      'vi': '',
    },
    'm3p1nav5': {
      'en': 'Home',
      'vi': '',
    },
  },
  // projectDetails
  {
    'hzf7vv3g': {
      'en': 'ACME Co.',
      'vi': '',
    },
    'bnriizwd': {
      'en': 'Contracts for New Opportunities',
      'vi': '',
    },
    'ac425m6t': {
      'en': 'Next Action',
      'vi': '',
    },
    '0lkcqytc': {
      'en': 'Tuesday, 10:00am',
      'vi': '',
    },
    'xkt9ate9': {
      'en': 'In Progress',
      'vi': '',
    },
    'udikb3vm': {
      'en': 'Contract Details',
      'vi': '',
    },
    'whboqvzl': {
      'en': '\$210,000',
      'vi': '',
    },
    '15rj2fwk': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'vi': '',
    },
    'p276ccr3': {
      'en': 'Mark as Complete',
      'vi': '',
    },
    'm2knpx9o': {
      'en': 'Contract Details',
      'vi': '',
    },
    'wyv95r0j': {
      'en': '\$120,000',
      'vi': '',
    },
    'x5qtqjk0': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'vi': '',
    },
    'wivtyhgw': {
      'en': 'Mark as Complete',
      'vi': '',
    },
    'u292sgwr': {
      'en': 'Home',
      'vi': '',
    },
  },
  // modal_success
  {
    '1901jfi0': {
      'en': 'Send Contract Confirmation',
      'vi': '',
    },
    '7u0jwzjw': {
      'en': 'A new contract has been generated for:',
      'vi': '',
    },
    '2z7o5vyk': {
      'en': 'Randy Alcorn',
      'vi': '',
    },
    '6hkorhzu': {
      'en': 'Head of Procurement',
      'vi': '',
    },
    'yqgji10t': {
      'en': 'ACME Co.',
      'vi': '',
    },
    'clq5b10l': {
      'en': 'Next Steps',
      'vi': '',
    },
    '15b4ett8': {
      'en':
          'Send the information below. And we will send an email with details to the customer and allow you to manage it in your dashboard.',
      'vi': '',
    },
    'smswk2li': {
      'en': 'Send Information',
      'vi': '',
    },
    'a6vvhy7g': {
      'en': 'Never Mind',
      'vi': '',
    },
  },
  // modal_Message
  {
    '7g9rx3b2': {
      'en': 'Congratulations!',
      'vi': '',
    },
    '7u3okf36': {
      'en':
          'Now that a contract has been generated for this customer please contact them with the date you will send the signed agreement.',
      'vi': '',
    },
    'i1r5tse4': {
      'en': 'Okay',
      'vi': '',
    },
    'jgh8g65i': {
      'en': 'Continue',
      'vi': '',
    },
  },
  // modal_Welcome
  {
    'li7qd1qn': {
      'en': 'Congratulations!',
      'vi': '',
    },
    'xebp6jv3': {
      'en': 'A new contract has been generated for:',
      'vi': '',
    },
    'hsr16qtm': {
      'en': 'Continue',
      'vi': '',
    },
  },
  // createComment
  {
    'k1rfxd4g': {
      'en': 'Create Note',
      'vi': '',
    },
    'um2fmlbq': {
      'en': 'Find members by searching below',
      'vi': '',
    },
    'ctvtlrfp': {
      'en': 'Ricky Rodriguez',
      'vi': '',
    },
    'a1ae8j77': {
      'en': 'Enter your note here...',
      'vi': '',
    },
    '5qw0cipg': {
      'en': 'Create Note',
      'vi': '',
    },
  },
  // mobileNav
  {
    '5b503lde': {
      'en': 'Dashboard',
      'vi': '',
    },
    '4hxgm0pc': {
      'en': 'My Team',
      'vi': '',
    },
    '0763gd8y': {
      'en': 'Customers',
      'vi': '',
    },
    'km6ufxoo': {
      'en': 'Contracts',
      'vi': '',
    },
    'url7b1rm': {
      'en': 'Profile',
      'vi': '',
    },
  },
  // webNav
  {
    'pfuabopo': {
      'en': 'Search',
      'vi': '',
    },
    'ebfqfpkz': {
      'en': 'Trung tâm điều khiển',
      'vi': '',
    },
    'owbztlej': {
      'en': 'Danh sách giáo viên',
      'vi': '',
    },
    'jh76lyq5': {
      'en': 'Danh sách học viên',
      'vi': '',
    },
    '1t2dr6ec': {
      'en': 'Contracts',
      'vi': '',
    },
    'glp2yqdb': {
      'en': 'Profile',
      'vi': '',
    },
  },
  // commandPalette
  {
    '7foq7oj6': {
      'en': 'Search platform...',
      'vi': '',
    },
    'x6jx0saj': {
      'en': 'Search',
      'vi': '',
    },
    'e5qa0dvs': {
      'en': 'Quick Links',
      'vi': '',
    },
    '1xr7469s': {
      'en': 'Find Contract',
      'vi': '',
    },
    '4jcio37u': {
      'en': 'Find Customer',
      'vi': '',
    },
    'y4hv03i6': {
      'en': 'New Contract',
      'vi': '',
    },
    'v7fhw0h7': {
      'en': 'New Customer',
      'vi': '',
    },
    '8l8ismxl': {
      'en': 'Recent Searches',
      'vi': '',
    },
    'ujw14ti8': {
      'en': 'Newport Financ',
      'vi': '',
    },
    'rzhoqxn7': {
      'en': 'Harry Styles',
      'vi': '',
    },
  },
  // Miscellaneous
  {
    '65e2tfs2': {
      'en': '',
      'vi': '',
    },
    'ddazihx4': {
      'en': '',
      'vi': '',
    },
    'db03cpjj': {
      'en': '',
      'vi': '',
    },
    'fdb9078p': {
      'en': '',
      'vi': '',
    },
    '80ouzj9q': {
      'en': '',
      'vi': '',
    },
    '6rzhptp9': {
      'en': '',
      'vi': '',
    },
    'ce8c4ty0': {
      'en': '',
      'vi': '',
    },
    'o9ntief5': {
      'en': '',
      'vi': '',
    },
    '4adk3vvx': {
      'en': '',
      'vi': '',
    },
    'xkghg8o1': {
      'en': '',
      'vi': '',
    },
    '1akbdhcr': {
      'en': '',
      'vi': '',
    },
    'kcvqa08x': {
      'en': '',
      'vi': '',
    },
    'dqrzd6sq': {
      'en': '',
      'vi': '',
    },
    'dpqtohyf': {
      'en': '',
      'vi': '',
    },
    'v01vf71s': {
      'en': '',
      'vi': '',
    },
    'gcv6def1': {
      'en': '',
      'vi': '',
    },
    'um9es99m': {
      'en': '',
      'vi': '',
    },
    'o4enbz4j': {
      'en': '',
      'vi': '',
    },
    '8z4tvfh7': {
      'en': '',
      'vi': '',
    },
    '2ybzla8x': {
      'en': '',
      'vi': '',
    },
    'd1wdf5i1': {
      'en': '',
      'vi': '',
    },
    'vtrqtrj4': {
      'en': '',
      'vi': '',
    },
    '2py80kgi': {
      'en': '',
      'vi': '',
    },
    'p6lsrh2a': {
      'en': '',
      'vi': '',
    },
    'ne8cclp9': {
      'en': '',
      'vi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
