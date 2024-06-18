// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:conversorapp/src/repositories/moeda_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Convert XML em lista de MoedaModel', () {
    final repository = MoedaRepository();
    final moedas = repository.parseMoedas(xml);
    print(moedas);
  });

  test('Get de cotação', () {
    final repository = MoedaRepository();
    final cotacao = repository.parseCotacao(json, 'USDBRL');

    expect(cotacao, 4.8632);
  });
}

const json = '''
{"USDBRL":{"code":"USD","codein":"BRL","name":"Dólar Americano/Real Brasileiro","high":"4.8636","low":"4.8636","varBid":"0.0004","pctChange":"0.01","bid":"4.8632","ask":"4.864","timestamp":"1700173800","create_date":"2023-11-16 19:30:00"}}
''';

const xml = '''
<xml>
<USD-BRL>Dólar Americano/Real Brasileiro</USD-BRL>
<USD-BRLT>Dólar Americano/Real Brasileiro Turismo</USD-BRLT>
<CAD-BRL>Dólar Canadense/Real Brasileiro</CAD-BRL>
<EUR-BRL>Euro/Real Brasileiro</EUR-BRL>
<GBP-BRL>Libra Esterlina/Real Brasileiro</GBP-BRL>
<ARS-BRL>Peso Argentino/Real Brasileiro</ARS-BRL>
<BTC-BRL>Bitcoin/Real Brasileiro</BTC-BRL>
<LTC-BRL>Litecoin/Real Brasileiro</LTC-BRL>
<JPY-BRL>Iene Japonês/Real Brasileiro</JPY-BRL>
<CHF-BRL>Franco Suíço/Real Brasileiro</CHF-BRL>
<AUD-BRL>Dólar Australiano/Real Brasileiro</AUD-BRL>
<CNY-BRL>Yuan Chinês/Real Brasileiro</CNY-BRL>
<ILS-BRL>Novo Shekel Israelense/Real Brasileiro</ILS-BRL>
<ETH-BRL>Ethereum/Real Brasileiro</ETH-BRL>
<XRP-BRL>XRP/Real Brasileiro</XRP-BRL>
<EUR-USD>Euro/Dólar Americano</EUR-USD>
<CAD-USD>Dólar Canadense/Dólar Americano</CAD-USD>
<GBP-USD>Libra Esterlina/Dólar Americano</GBP-USD>
<ARS-USD>Peso Argentino/Dólar Americano</ARS-USD>
<JPY-USD>Iene Japonês/Dólar Americano</JPY-USD>
<CHF-USD>Franco Suíço/Dólar Americano</CHF-USD>
<AUD-USD>Dólar Australiano/Dólar Americano</AUD-USD>
<CNY-USD>Yuan Chinês/Dólar Americano</CNY-USD>
<ILS-USD>Novo Shekel Israelense/Dólar Americano</ILS-USD>
<BTC-USD>Bitcoin/Dólar Americano</BTC-USD>
<LTC-USD>Litecoin/Dólar Americano</LTC-USD>
<ETH-USD>Ethereum/Dólar Americano</ETH-USD>
<XRP-USD>XRP/Dólar Americano</XRP-USD>
<BRL-USD>Real Brasileiro/Dólar Americano</BRL-USD>
<BRL-EUR>Real Brasileiro/Euro</BRL-EUR>
<USD-EUR>Dólar Americano/Euro</USD-EUR>
<CAD-EUR>Dólar Canadense/Euro</CAD-EUR>
<GBP-EUR>Libra Esterlina/Euro</GBP-EUR>
<ARS-EUR>Peso Argentino/Euro</ARS-EUR>
<JPY-EUR>Iene Japonês/Euro</JPY-EUR>
<CHF-EUR>Franco Suíço/Euro</CHF-EUR>
<AUD-EUR>Dólar Australiano/Euro</AUD-EUR>
<CNY-EUR>Yuan Chinês/Euro</CNY-EUR>
<ILS-EUR>Novo Shekel Israelense/Euro</ILS-EUR>
<BTC-EUR>Bitcoin/Euro</BTC-EUR>
<LTC-EUR>Litecoin/Euro</LTC-EUR>
<ETH-EUR>Ethereum/Euro</ETH-EUR>
<XRP-EUR>XRP/Euro</XRP-EUR>
<DOGE-BRL>Dogecoin/Real Brasileiro</DOGE-BRL>
<DOGE-EUR>Dogecoin/Euro</DOGE-EUR>
<DOGE-USD>Dogecoin/Dólar Americano</DOGE-USD>
<USD-JPY>Dólar Americano/Iene Japonês</USD-JPY>
<USD-CHF>Dólar Americano/Franco Suíço</USD-CHF>
<USD-CAD>Dólar Americano/Dólar Canadense</USD-CAD>
<NZD-USD>Dólar Neozelandês/Dólar Americano</NZD-USD>
<USD-ZAR>Dólar Americano/Rand Sul-Africano</USD-ZAR>
<USD-TRY>Dólar Americano/Nova Lira Turca</USD-TRY>
<USD-MXN>Dólar Americano/Peso Mexicano</USD-MXN>
<USD-PLN>Dólar Americano/Zlóti Polonês</USD-PLN>
<USD-SEK>Dólar Americano/Coroa Sueca</USD-SEK>
<USD-SGD>Dólar Americano/Dólar de Cingapura</USD-SGD>
<USD-DKK>Dólar Americano/Coroa Dinamarquesa</USD-DKK>
<USD-NOK>Dólar Americano/Coroa Norueguesa</USD-NOK>
<USD-ILS>Dólar Americano/Novo Shekel Israelense</USD-ILS>
<USD-HUF>Dólar Americano/Florim Húngaro</USD-HUF>
<USD-CZK>Dólar Americano/Coroa Checa</USD-CZK>
<USD-THB>Dólar Americano/Baht Tailandês</USD-THB>
<USD-AED>Dólar Americano/Dirham dos Emirados</USD-AED>
<USD-JOD>Dólar Americano/Dinar Jordaniano</USD-JOD>
<USD-KWD>Dólar Americano/Dinar Kuwaitiano</USD-KWD>
<USD-HKD>Dólar Americano/Dólar de Hong Kong</USD-HKD>
<USD-SAR>Dólar Americano/Riyal Saudita</USD-SAR>
<USD-INR>Dólar Americano/Rúpia Indiana</USD-INR>
<USD-KRW>Dólar Americano/Won Sul-Coreano</USD-KRW>
<FJD-USD>Dólar de Fiji/Dólar Americano</FJD-USD>
<GHS-USD>Cedi Ganês/Dólar Americano</GHS-USD>
<KYD-USD>Dólar das Ilhas Cayman/Dólar Americano</KYD-USD>
<SGD-USD>Dólar de Cingapura/Dólar Americano</SGD-USD>
<USD-ALL>Dólar Americano/Lek Albanês</USD-ALL>
<USD-AMD>Dólar Americano/Dram Armênio</USD-AMD>
<USD-ANG>Dólar Americano/Guilder das Antilhas</USD-ANG>
<USD-ARS>Dólar Americano/Peso Argentino</USD-ARS>
<USD-AUD>Dólar Americano/Dólar Australiano</USD-AUD>
<USD-BBD>Dólar Americano/Dólar de Barbados</USD-BBD>
<USD-BDT>Dólar Americano/Taka de Bangladesh</USD-BDT>
<USD-BGN>Dólar Americano/Lev Búlgaro</USD-BGN>
<USD-BHD>Dólar Americano/Dinar do Bahrein</USD-BHD>
<USD-BIF>Dólar Americano/Franco Burundinense</USD-BIF>
<USD-BND>Dólar Americano/Dólar de Brunei</USD-BND>
<USD-BOB>Dólar Americano/Boliviano</USD-BOB>
<USD-BSD>Dólar Americano/Dólar das Bahamas</USD-BSD>
<USD-BWP>Dólar Americano/Pula de Botswana</USD-BWP>
<USD-BZD>Dólar Americano/Dólar de Belize</USD-BZD>
<USD-CLP>Dólar Americano/Peso Chileno</USD-CLP>
<USD-CNY>Dólar Americano/Yuan Chinês</USD-CNY>
<USD-COP>Dólar Americano/Peso Colombiano</USD-COP>
<USD-CRC>Dólar Americano/Colón Costarriquenho</USD-CRC>
<USD-CUP>Dólar Americano/Peso Cubano</USD-CUP>
<USD-DJF>Dólar Americano/Franco do Djubouti</USD-DJF>
<USD-DOP>Dólar Americano/Peso Dominicano</USD-DOP>
<USD-DZD>Dólar Americano/Dinar Argelino</USD-DZD>
<USD-EGP>Dólar Americano/Libra Egípcia</USD-EGP>
<USD-ETB>Dólar Americano/Birr Etíope</USD-ETB>
<USD-FJD>Dólar Americano/Dólar de Fiji</USD-FJD>
<USD-GBP>Dólar Americano/Libra Esterlina</USD-GBP>
<USD-GEL>Dólar Americano/Lari Georgiano</USD-GEL>
<USD-GHS>Dólar Americano/Cedi Ganês</USD-GHS>
<USD-GMD>Dólar Americano/Dalasi da Gâmbia</USD-GMD>
<USD-GNF>Dólar Americano/Franco de Guiné</USD-GNF>
<USD-GTQ>Dólar Americano/Quetzal Guatemalteco</USD-GTQ>
<USD-HNL>Dólar Americano/Lempira Hondurenha</USD-HNL>
<USD-HRK>Dólar Americano/Kuna Croata</USD-HRK>
<USD-HTG>Dólar Americano/Gourde Haitiano</USD-HTG>
<USD-IDR>Dólar Americano/Rupia Indonésia</USD-IDR>
<USD-IQD>Dólar Americano/Dinar Iraquiano</USD-IQD>
<USD-IRR>Dólar Americano/Rial Iraniano</USD-IRR>
<USD-ISK>Dólar Americano/Coroa Islandesa</USD-ISK>
<USD-JMD>Dólar Americano/Dólar Jamaicano</USD-JMD>
<USD-KES>Dólar Americano/Shilling Queniano</USD-KES>
<USD-KHR>Dólar Americano/Riel Cambojano</USD-KHR>
<USD-KMF>Dólar Americano/Franco Comorense</USD-KMF>
<USD-KZT>Dólar Americano/Tengue Cazaquistanês</USD-KZT>
<USD-LAK>Dólar Americano/Kip Laosiano</USD-LAK>
<USD-LBP>Dólar Americano/Libra Libanesa</USD-LBP>
<USD-LKR>Dólar Americano/Rúpia de Sri Lanka</USD-LKR>
<USD-LSL>Dólar Americano/Loti do Lesoto</USD-LSL>
<USD-LYD>Dólar Americano/Dinar Líbio</USD-LYD>
<USD-MAD>Dólar Americano/Dirham Marroquino</USD-MAD>
<USD-MDL>Dólar Americano/Leu Moldavo</USD-MDL>
<USD-MGA>Dólar Americano/Ariary Madagascarense</USD-MGA>
<USD-MKD>Dólar Americano/Denar Macedônio</USD-MKD>
<USD-MMK>Dólar Americano/Kyat de Mianmar</USD-MMK>
<USD-MOP>Dólar Americano/Pataca de Macau</USD-MOP>
<USD-MRO>Dólar Americano/Ouguiya Mauritana</USD-MRO>
<USD-MUR>Dólar Americano/Rúpia Mauriciana</USD-MUR>
<USD-MVR>Dólar Americano/Rufiyaa Maldiva</USD-MVR>
<USD-MWK>Dólar Americano/Kwacha Malauiana</USD-MWK>
<USD-MYR>Dólar Americano/Ringgit Malaio</USD-MYR>
<USD-NAD>Dólar Americano/Dólar Namíbio</USD-NAD>
<USD-NGN>Dólar Americano/Naira Nigeriana</USD-NGN>
<USD-NIO>Dólar Americano/Córdoba Nicaraguense</USD-NIO>
<USD-NPR>Dólar Americano/Rúpia Nepalesa</USD-NPR>
<USD-NZD>Dólar Americano/Dólar Neozelandês</USD-NZD>
<USD-OMR>Dólar Americano/Rial Omanense</USD-OMR>
<USD-PAB>Dólar Americano/Balboa Panamenho</USD-PAB>
<USD-PEN>Dólar Americano/Sol do Peru</USD-PEN>
<USD-PGK>Dólar Americano/Kina Papua-Nova Guiné</USD-PGK>
<USD-PHP>Dólar Americano/Peso Filipino</USD-PHP>
<USD-PKR>Dólar Americano/Rúpia Paquistanesa</USD-PKR>
<USD-PYG>Dólar Americano/Guarani Paraguaio</USD-PYG>
<USD-QAR>Dólar Americano/Rial Catarense</USD-QAR>
<USD-RON>Dólar Americano/Leu Romeno</USD-RON>
<USD-RSD>Dólar Americano/Dinar Sérvio</USD-RSD>
<USD-RWF>Dólar Americano/Franco Ruandês</USD-RWF>
<USD-SCR>Dólar Americano/Rúpias de Seicheles</USD-SCR>
<USD-SDG>Dólar Americano/Libra Sudanesa</USD-SDG>
<USD-SOS>Dólar Americano/Shilling Somaliano</USD-SOS>
<USD-STD>Dólar Americano/Dobra São Tomé/Príncipe</USD-STD>
<USD-SVC>Dólar Americano/Colon de El Salvador</USD-SVC>
<USD-SYP>Dólar Americano/Libra Síria</USD-SYP>
<USD-SZL>Dólar Americano/Lilangeni Suazilandês</USD-SZL>
<USD-TND>Dólar Americano/Dinar Tunisiano</USD-TND>
<USD-TTD>Dólar Americano/Dólar de Trinidad</USD-TTD>
<USD-TWD>Dólar Americano/Dólar Taiuanês</USD-TWD>
<USD-TZS>Dólar Americano/Shilling Tanzaniano</USD-TZS>
<USD-UAH>Dólar Americano/Hryvinia Ucraniana</USD-UAH>
<USD-UGX>Dólar Americano/Shilling Ugandês</USD-UGX>
<USD-UYU>Dólar Americano/Peso Uruguaio</USD-UYU>
<USD-UZS>Dólar Americano/Som Uzbequistanês</USD-UZS>
<USD-VEF>Dólar Americano/Bolívar Venezuelano</USD-VEF>
<USD-VND>Dólar Americano/Dong Vietnamita</USD-VND>
<USD-VUV>Dólar Americano/Vatu de Vanuatu</USD-VUV>
<USD-XAF>Dólar Americano/Franco CFA Central</USD-XAF>
<USD-XCD>Dólar Americano/Dólar do Caribe Oriental</USD-XCD>
<USD-XOF>Dólar Americano/Franco CFA Ocidental</USD-XOF>
<USD-XPF>Dólar Americano/Franco CFP</USD-XPF>
<USD-YER>Dólar Americano/Riyal Iemenita</USD-YER>
<USD-ZMK>Dólar Americano/Kwacha Zambiana</USD-ZMK>
<AED-USD>Dirham dos Emirados/Dólar Americano</AED-USD>
<DKK-USD>Coroa Dinamarquesa/Dólar Americano</DKK-USD>
<HKD-USD>Dólar de Hong Kong/Dólar Americano</HKD-USD>
<MXN-USD>Peso Mexicano/Dólar Americano</MXN-USD>
<NOK-USD>Coroa Norueguesa/Dólar Americano</NOK-USD>
<PLN-USD>Zlóti Polonês/Dólar Americano</PLN-USD>
<RUB-USD>Rublo Russo/Dólar Americano</RUB-USD>
<SAR-USD>Riyal Saudita/Dólar Americano</SAR-USD>
<SEK-USD>Coroa Sueca/Dólar Americano</SEK-USD>
<TRY-USD>Nova Lira Turca/Dólar Americano</TRY-USD>
<TWD-USD>Dólar Taiuanês/Dólar Americano</TWD-USD>
<VEF-USD>Bolívar Venezuelano/Dólar Americano</VEF-USD>
<ZAR-USD>Rand Sul-Africano/Dólar Americano</ZAR-USD>
<UYU-USD>Peso Uruguaio/Dólar Americano</UYU-USD>
<PYG-USD>Guarani Paraguaio/Dólar Americano</PYG-USD>
<CLP-USD>Peso Chileno/Dólar Americano</CLP-USD>
<COP-USD>Peso Colombiano/Dólar Americano</COP-USD>
<PEN-USD>Sol do Peru/Dólar Americano</PEN-USD>
<NIO-USD>Córdoba Nicaraguense/Dólar Americano</NIO-USD>
<BOB-USD>Boliviano/Dólar Americano</BOB-USD>
<KRW-USD>Won Sul-Coreano/Dólar Americano</KRW-USD>
<EGP-USD>Libra Egípcia/Dólar Americano</EGP-USD>
<USD-BYN>Dólar Americano/Rublo Bielorrusso</USD-BYN>
<USD-MZN>Dólar Americano/Metical de Moçambique</USD-MZN>
<INR-USD>Rúpia Indiana/Dólar Americano</INR-USD>
<JOD-USD>Dinar Jordaniano/Dólar Americano</JOD-USD>
<KWD-USD>Dinar Kuwaitiano/Dólar Americano</KWD-USD>
<USD-AZN>Dólar Americano/Manat Azeri</USD-AZN>
<USD-CNH>Dólar Americano/Yuan chinês offshore</USD-CNH>
<USD-KGS>Dólar Americano/Som Quirguistanês</USD-KGS>
<USD-TJS>Dólar Americano/Somoni do Tajiquistão</USD-TJS>
<USD-RUB>Dólar Americano/Rublo Russo</USD-RUB>
<MYR-USD>Ringgit Malaio/Dólar Americano</MYR-USD>
<UAH-USD>Hryvinia Ucraniana/Dólar Americano</UAH-USD>
<HUF-USD>Florim Húngaro/Dólar Americano</HUF-USD>
<IDR-USD>Rupia Indonésia/Dólar Americano</IDR-USD>
<USD-AOA>Dólar Americano/Kwanza Angolano</USD-AOA>
<VND-USD>Dong Vietnamita/Dólar Americano</VND-USD>
<BYN-USD>Rublo Bielorrusso/Dólar Americano</BYN-USD>
<XBR-USD>Brent Spot/Dólar Americano</XBR-USD>
<THB-USD>Baht Tailandês/Dólar Americano</THB-USD>
<PHP-USD>Peso Filipino/Dólar Americano</PHP-USD>
<USD-TMT>Dólar Americano/TMT</USD-TMT>
<XAGG-USD>Prata/Dólar Americano</XAGG-USD>
<USD-MNT>Dólar Americano/Mongolian Tugrik</USD-MNT>
<USD-AFN>Dólar Americano/Afghani do Afeganistão</USD-AFN>
<AFN-USD>Afghani do Afeganistão/Dólar Americano</AFN-USD>
<SYP-USD>Libra Síria/Dólar Americano</SYP-USD>
<IRR-USD>Rial Iraniano/Dólar Americano</IRR-USD>
<IQD-USD>Dinar Iraquiano/Dólar Americano</IQD-USD>
<USD-NGNI>Dólar Americano/Naira Nigeriana</USD-NGNI>
<USD-ZWL>Dólar Americano/Dólar Zimbabuense</USD-ZWL>
<BRL-ARS>Real Brasileiro/Peso Argentino</BRL-ARS>
<BRL-AUD>Real Brasileiro/Dólar Australiano</BRL-AUD>
<BRL-CAD>Real Brasileiro/Dólar Canadense</BRL-CAD>
<BRL-CHF>Real Brasileiro/Franco Suíço</BRL-CHF>
<BRL-CLP>Real Brasileiro/Peso Chileno</BRL-CLP>
<BRL-DKK>Real Brasileiro/Coroa Dinamarquesa</BRL-DKK>
<BRL-HKD>Real Brasileiro/Dólar de Hong Kong</BRL-HKD>
<BRL-JPY>Real Brasileiro/Iene Japonês</BRL-JPY>
<BRL-MXN>Real Brasileiro/Peso Mexicano</BRL-MXN>
<BRL-SGD>Real Brasileiro/Dólar de Cingapura</BRL-SGD>
<SGD-BRL>Dólar de Cingapura/Real Brasileiro</SGD-BRL>
<AED-BRL>Dirham dos Emirados/Real Brasileiro</AED-BRL>
<BRL-AED>Real Brasileiro/Dirham dos Emirados</BRL-AED>
<BRL-BBD>Real Brasileiro/Dólar de Barbados</BRL-BBD>
<BRL-BHD>Real Brasileiro/Dinar do Bahrein</BRL-BHD>
<BRL-CNY>Real Brasileiro/Yuan Chinês</BRL-CNY>
<BRL-CZK>Real Brasileiro/Coroa Checa</BRL-CZK>
<BRL-EGP>Real Brasileiro/Libra Egípcia</BRL-EGP>
<BRL-GBP>Real Brasileiro/Libra Esterlina</BRL-GBP>
<BRL-HUF>Real Brasileiro/Florim Húngaro</BRL-HUF>
<BRL-IDR>Real Brasileiro/Rupia Indonésia</BRL-IDR>
<BRL-ILS>Real Brasileiro/Novo Shekel Israelense</BRL-ILS>
<BRL-INR>Real Brasileiro/Rúpia Indiana</BRL-INR>
<BRL-ISK>Real Brasileiro/Coroa Islandesa</BRL-ISK>
<BRL-JMD>Real Brasileiro/Dólar Jamaicano</BRL-JMD>
<BRL-JOD>Real Brasileiro/Dinar Jordaniano</BRL-JOD>
<BRL-KES>Real Brasileiro/Shilling Queniano</BRL-KES>
<BRL-KRW>Real Brasileiro/Won Sul-Coreano</BRL-KRW>
<BRL-LBP>Real Brasileiro/Libra Libanesa</BRL-LBP>
<BRL-LKR>Real Brasileiro/Rúpia de Sri Lanka</BRL-LKR>
<BRL-MAD>Real Brasileiro/Dirham Marroquino</BRL-MAD>
<BRL-MYR>Real Brasileiro/Ringgit Malaio</BRL-MYR>
<BRL-NAD>Real Brasileiro/Dólar Namíbio</BRL-NAD>
<BRL-NOK>Real Brasileiro/Coroa Norueguesa</BRL-NOK>
<BRL-NPR>Real Brasileiro/Rúpia Nepalesa</BRL-NPR>
<BRL-NZD>Real Brasileiro/Dólar Neozelandês</BRL-NZD>
<BRL-OMR>Real Brasileiro/Rial Omanense</BRL-OMR>
<BRL-PAB>Real Brasileiro/Balboa Panamenho</BRL-PAB>
<BRL-PHP>Real Brasileiro/Peso Filipino</BRL-PHP>
<BRL-PKR>Real Brasileiro/Rúpia Paquistanesa</BRL-PKR>
<BRL-PLN>Real Brasileiro/Zlóti Polonês</BRL-PLN>
<BRL-QAR>Real Brasileiro/Rial Catarense</BRL-QAR>
<BRL-RON>Real Brasileiro/Leu Romeno</BRL-RON>
<BRL-RUB>Real Brasileiro/Rublo Russo</BRL-RUB>
<BRL-SAR>Real Brasileiro/Riyal Saudita</BRL-SAR>
<BRL-SEK>Real Brasileiro/Coroa Sueca</BRL-SEK>
<BRL-THB>Real Brasileiro/Baht Tailandês</BRL-THB>
<BRL-TRY>Real Brasileiro/Nova Lira Turca</BRL-TRY>
<BRL-VEF>Real Brasileiro/Bolívar Venezuelano</BRL-VEF>
<BRL-XAF>Real Brasileiro/Franco CFA Central</BRL-XAF>
<BRL-XCD>Real Brasileiro/Dólar do Caribe Oriental</BRL-XCD>
<BRL-XOF>Real Brasileiro/Franco CFA Ocidental</BRL-XOF>
<BRL-ZAR>Real Brasileiro/Rand Sul-Africano</BRL-ZAR>
<BRL-TWD>Real Brasileiro/Dólar Taiuanês</BRL-TWD>
<DKK-BRL>Coroa Dinamarquesa/Real Brasileiro</DKK-BRL>
<HKD-BRL>Dólar de Hong Kong/Real Brasileiro</HKD-BRL>
<MXN-BRL>Peso Mexicano/Real Brasileiro</MXN-BRL>
<NOK-BRL>Coroa Norueguesa/Real Brasileiro</NOK-BRL>
<NZD-BRL>Dólar Neozelandês/Real Brasileiro</NZD-BRL>
<PLN-BRL>Zlóti Polonês/Real Brasileiro</PLN-BRL>
<SAR-BRL>Riyal Saudita/Real Brasileiro</SAR-BRL>
<SEK-BRL>Coroa Sueca/Real Brasileiro</SEK-BRL>
<THB-BRL>Baht Tailandês/Real Brasileiro</THB-BRL>
<TRY-BRL>Nova Lira Turca/Real Brasileiro</TRY-BRL>
<TWD-BRL>Dólar Taiuanês/Real Brasileiro</TWD-BRL>
<VEF-BRL>Bolívar Venezuelano/Real Brasileiro</VEF-BRL>
<ZAR-BRL>Rand Sul-Africano/Real Brasileiro</ZAR-BRL>
<BRL-PYG>Real Brasileiro/Guarani Paraguaio</BRL-PYG>
<BRL-UYU>Real Brasileiro/Peso Uruguaio</BRL-UYU>
<BRL-COP>Real Brasileiro/Peso Colombiano</BRL-COP>
<BRL-PEN>Real Brasileiro/Sol do Peru</BRL-PEN>
<BRL-BOB>Real Brasileiro/Boliviano</BRL-BOB>
<CLP-BRL>Peso Chileno/Real Brasileiro</CLP-BRL>
<PYG-BRL>Guarani Paraguaio/Real Brasileiro</PYG-BRL>
<UYU-BRL>Peso Uruguaio/Real Brasileiro</UYU-BRL>
<COP-BRL>Peso Colombiano/Real Brasileiro</COP-BRL>
<PEN-BRL>Sol do Peru/Real Brasileiro</PEN-BRL>
<BOB-BRL>Boliviano/Real Brasileiro</BOB-BRL>
<RUB-BRL>Rublo Russo/Real Brasileiro</RUB-BRL>
<INR-BRL>Rúpia Indiana/Real Brasileiro</INR-BRL>
<EUR-GBP>Euro/Libra Esterlina</EUR-GBP>
<EUR-JPY>Euro/Iene Japonês</EUR-JPY>
<EUR-CHF>Euro/Franco Suíço</EUR-CHF>
<EUR-AUD>Euro/Dólar Australiano</EUR-AUD>
<EUR-CAD>Euro/Dólar Canadense</EUR-CAD>
<EUR-NOK>Euro/Coroa Norueguesa</EUR-NOK>
<EUR-DKK>Euro/Coroa Dinamarquesa</EUR-DKK>
<EUR-PLN>Euro/Zlóti Polonês</EUR-PLN>
<EUR-NZD>Euro/Dólar Neozelandês</EUR-NZD>
<EUR-SEK>Euro/Coroa Sueca</EUR-SEK>
<EUR-ILS>Euro/Novo Shekel Israelense</EUR-ILS>
<EUR-TRY>Euro/Nova Lira Turca</EUR-TRY>
<EUR-THB>Euro/Baht Tailandês</EUR-THB>
<EUR-ZAR>Euro/Rand Sul-Africano</EUR-ZAR>
<EUR-MXN>Euro/Peso Mexicano</EUR-MXN>
<EUR-SGD>Euro/Dólar de Cingapura</EUR-SGD>
<EUR-HUF>Euro/Florim Húngaro</EUR-HUF>
<EUR-HKD>Euro/Dólar de Hong Kong</EUR-HKD>
<EUR-CZK>Euro/Coroa Checa</EUR-CZK>
<EUR-KRW>Euro/Won Sul-Coreano</EUR-KRW>
<BHD-EUR>Dinar do Bahrein/Euro</BHD-EUR>
<EUR-AED>Euro/Dirham dos Emirados</EUR-AED>
<EUR-AFN>Euro/Afghani do Afeganistão</EUR-AFN>
<EUR-ALL>Euro/Lek Albanês</EUR-ALL>
<EUR-ANG>Euro/Guilder das Antilhas</EUR-ANG>
<EUR-ARS>Euro/Peso Argentino</EUR-ARS>
<EUR-BAM>Euro/Marco Conversível</EUR-BAM>
<EUR-BBD>Euro/Dólar de Barbados</EUR-BBD>
<EUR-BDT>Euro/Taka de Bangladesh</EUR-BDT>
<EUR-BGN>Euro/Lev Búlgaro</EUR-BGN>
<EUR-BHD>Euro/Dinar do Bahrein</EUR-BHD>
<EUR-BIF>Euro/Franco Burundinense</EUR-BIF>
<EUR-BND>Euro/Dólar de Brunei</EUR-BND>
<EUR-BOB>Euro/Boliviano</EUR-BOB>
<EUR-BSD>Euro/Dólar das Bahamas</EUR-BSD>
<EUR-BWP>Euro/Pula de Botswana</EUR-BWP>
<EUR-BYN>Euro/Rublo Bielorrusso</EUR-BYN>
<EUR-BZD>Euro/Dólar de Belize</EUR-BZD>
<EUR-CLP>Euro/Peso Chileno</EUR-CLP>
<EUR-CNY>Euro/Yuan Chinês</EUR-CNY>
<EUR-COP>Euro/Peso Colombiano</EUR-COP>
<EUR-CRC>Euro/Colón Costarriquenho</EUR-CRC>
<EUR-CUP>Euro/Peso Cubano</EUR-CUP>
<EUR-CVE>Euro/Escudo cabo-verdiano</EUR-CVE>
<EUR-DJF>Euro/Franco do Djubouti</EUR-DJF>
<EUR-DOP>Euro/Peso Dominicano</EUR-DOP>
<EUR-DZD>Euro/Dinar Argelino</EUR-DZD>
<EUR-EGP>Euro/Libra Egípcia</EUR-EGP>
<EUR-ETB>Euro/Birr Etíope</EUR-ETB>
<EUR-FJD>Euro/Dólar de Fiji</EUR-FJD>
<EUR-GHS>Euro/Cedi Ganês</EUR-GHS>
<EUR-GMD>Euro/Dalasi da Gâmbia</EUR-GMD>
<EUR-GNF>Euro/Franco de Guiné</EUR-GNF>
<EUR-GTQ>Euro/Quetzal Guatemalteco</EUR-GTQ>
<EUR-HNL>Euro/Lempira Hondurenha</EUR-HNL>
<EUR-HRK>Euro/Kuna Croata</EUR-HRK>
<EUR-HTG>Euro/Gourde Haitiano</EUR-HTG>
<EUR-IDR>Euro/Rupia Indonésia</EUR-IDR>
<EUR-INR>Euro/Rúpia Indiana</EUR-INR>
<EUR-IQD>Euro/Dinar Iraquiano</EUR-IQD>
<EUR-IRR>Euro/Rial Iraniano</EUR-IRR>
<EUR-ISK>Euro/Coroa Islandesa</EUR-ISK>
<EUR-JMD>Euro/Dólar Jamaicano</EUR-JMD>
<EUR-JOD>Euro/Dinar Jordaniano</EUR-JOD>
<EUR-KES>Euro/Shilling Queniano</EUR-KES>
<EUR-KHR>Euro/Riel Cambojano</EUR-KHR>
<EUR-KWD>Euro/Dinar Kuwaitiano</EUR-KWD>
<EUR-KYD>Euro/Dólar das Ilhas Cayman</EUR-KYD>
<EUR-KZT>Euro/Tengue Cazaquistanês</EUR-KZT>
<EUR-LAK>Euro/Kip Laosiano</EUR-LAK>
<EUR-LBP>Euro/Libra Libanesa</EUR-LBP>
<EUR-LKR>Euro/Rúpia de Sri Lanka</EUR-LKR>
<EUR-LSL>Euro/Loti do Lesoto</EUR-LSL>
<EUR-LYD>Euro/Dinar Líbio</EUR-LYD>
<EUR-MAD>Euro/Dirham Marroquino</EUR-MAD>
<EUR-MDL>Euro/Leu Moldavo</EUR-MDL>
<EUR-MGA>Euro/Ariary Madagascarense</EUR-MGA>
<EUR-MKD>Euro/Denar Macedônio</EUR-MKD>
<EUR-MMK>Euro/Kyat de Mianmar</EUR-MMK>
<EUR-MOP>Euro/Pataca de Macau</EUR-MOP>
<EUR-MRO>Euro/Ouguiya Mauritana</EUR-MRO>
<EUR-MUR>Euro/Rúpia Mauriciana</EUR-MUR>
<EUR-MWK>Euro/Kwacha Malauiana</EUR-MWK>
<EUR-MYR>Euro/Ringgit Malaio</EUR-MYR>
<EUR-NAD>Euro/Dólar Namíbio</EUR-NAD>
<EUR-NGN>Euro/Naira Nigeriana</EUR-NGN>
<EUR-NIO>Euro/Córdoba Nicaraguense</EUR-NIO>
<EUR-NPR>Euro/Rúpia Nepalesa</EUR-NPR>
<EUR-OMR>Euro/Rial Omanense</EUR-OMR>
<EUR-PAB>Euro/Balboa Panamenho</EUR-PAB>
<EUR-PEN>Euro/Sol do Peru</EUR-PEN>
<EUR-PGK>Euro/Kina Papua-Nova Guiné</EUR-PGK>
<EUR-PHP>Euro/Peso Filipino</EUR-PHP>
<EUR-PKR>Euro/Rúpia Paquistanesa</EUR-PKR>
<EUR-PYG>Euro/Guarani Paraguaio</EUR-PYG>
<EUR-QAR>Euro/Rial Catarense</EUR-QAR>
<EUR-RON>Euro/Leu Romeno</EUR-RON>
<EUR-RSD>Euro/Dinar Sérvio</EUR-RSD>
<EUR-RWF>Euro/Franco Ruandês</EUR-RWF>
<EUR-SAR>Euro/Riyal Saudita</EUR-SAR>
<EUR-SCR>Euro/Rúpias de Seicheles</EUR-SCR>
<EUR-SDG>Euro/Libra Sudanesa</EUR-SDG>
<EUR-SDR>Euro/DSE</EUR-SDR>
<EUR-SOS>Euro/Shilling Somaliano</EUR-SOS>
<EUR-STD>Euro/Dobra São Tomé/Príncipe</EUR-STD>
<EUR-SVC>Euro/Colon de El Salvador</EUR-SVC>
<EUR-SYP>Euro/Libra Síria</EUR-SYP>
<EUR-SZL>Euro/Lilangeni Suazilandês</EUR-SZL>
<EUR-TND>Euro/Dinar Tunisiano</EUR-TND>
<EUR-TTD>Euro/Dólar de Trinidad</EUR-TTD>
<EUR-TWD>Euro/Dólar Taiuanês</EUR-TWD>
<EUR-TZS>Euro/Shilling Tanzaniano</EUR-TZS>
<EUR-UAH>Euro/Hryvinia Ucraniana</EUR-UAH>
<EUR-UGX>Euro/Shilling Ugandês</EUR-UGX>
<EUR-UYU>Euro/Peso Uruguaio</EUR-UYU>
<EUR-UZS>Euro/Som Uzbequistanês</EUR-UZS>
<EUR-VEF>Euro/Bolívar Venezuelano</EUR-VEF>
<EUR-VND>Euro/Dong Vietnamita</EUR-VND>
<EUR-XAF>Euro/Franco CFA Central</EUR-XAF>
<EUR-XOF>Euro/Franco CFA Ocidental</EUR-XOF>
<EUR-XPF>Euro/Franco CFP</EUR-XPF>
<EUR-ZMK>Euro/Kwacha Zambiana</EUR-ZMK>
<GHS-EUR>Cedi Ganês/Euro</GHS-EUR>
<NZD-EUR>Dólar Neozelandês/Euro</NZD-EUR>
<SGD-EUR>Dólar de Cingapura/Euro</SGD-EUR>
<AED-EUR>Dirham dos Emirados/Euro</AED-EUR>
<DKK-EUR>Coroa Dinamarquesa/Euro</DKK-EUR>
<EUR-XCD>Euro/Dólar do Caribe Oriental</EUR-XCD>
<HKD-EUR>Dólar de Hong Kong/Euro</HKD-EUR>
<MXN-EUR>Peso Mexicano/Euro</MXN-EUR>
<NOK-EUR>Coroa Norueguesa/Euro</NOK-EUR>
<PLN-EUR>Zlóti Polonês/Euro</PLN-EUR>
<RUB-EUR>Rublo Russo/Euro</RUB-EUR>
<SAR-EUR>Riyal Saudita/Euro</SAR-EUR>
<SEK-EUR>Coroa Sueca/Euro</SEK-EUR>
<TRY-EUR>Nova Lira Turca/Euro</TRY-EUR>
<TWD-EUR>Dólar Taiuanês/Euro</TWD-EUR>
<VEF-EUR>Bolívar Venezuelano/Euro</VEF-EUR>
<ZAR-EUR>Rand Sul-Africano/Euro</ZAR-EUR>
<MAD-EUR>Dirham Marroquino/Euro</MAD-EUR>
<KRW-EUR>Won Sul-Coreano/Euro</KRW-EUR>
<EGP-EUR>Libra Egípcia/Euro</EGP-EUR>
<EUR-MZN>Euro/Metical de Moçambique</EUR-MZN>
<INR-EUR>Rúpia Indiana/Euro</INR-EUR>
<JOD-EUR>Dinar Jordaniano/Euro</JOD-EUR>
<KWD-EUR>Dinar Kuwaitiano/Euro</KWD-EUR>
<EUR-AZN>Euro/Manat Azeri</EUR-AZN>
<EUR-AMD>Euro/Dram Armênio</EUR-AMD>
<EUR-TJS>Euro/Somoni do Tajiquistão</EUR-TJS>
<EUR-RUB>Euro/Rublo Russo</EUR-RUB>
<HUF-EUR>Florim Húngaro/Euro</HUF-EUR>
<GEL-EUR>Lari Georgiano/Euro</GEL-EUR>
<EUR-GEL>Euro/Lari Georgiano</EUR-GEL>
<IDR-EUR>Rupia Indonésia/Euro</IDR-EUR>
<EUR-AOA>Euro/Kwanza Angolano</EUR-AOA>
<BYN-EUR>Rublo Bielorrusso/Euro</BYN-EUR>
<XAGG-EUR>Prata/Euro</XAGG-EUR>
<PEN-EUR>Sol do Peru/Euro</PEN-EUR>
</xml>
''';