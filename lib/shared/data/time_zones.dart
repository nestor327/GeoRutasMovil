Map<int, dynamic> getTimeZones() {
  return {
    1: {"offset": 0, "text": "(UTC) Europe/London"},
    2: {"offset": -1, "text": "(UTC-1:00) America/Scoresbysund"},
    3: {"offset": -2, "text": "(UTC-2:00) America/Noronha"},
    4: {"offset": -3, "text": "(UTC-3:00) America/Argentina/Buenos Aires"},
    5: {"offset": -4, "text": "(UTC-4:00) America/Puerto Rico"},
    6: {"offset": -5, "text": "(UTC-5:00) America/Panama"},
    7: {"offset": -6, "text": "(UTC-6:00) America/Managua"},
    8: {"offset": -7, "text": "(UTC-7:00) America/Cambridge_Bay"},
    9: {"offset": -8, "text": "(UTC-8:00) America/Vancouver"},
    10: {"offset": -9, "text": "(UTC-9:00) America/Juneau"},
    11: {"offset": -10, "text": "(UTC-10:00) America/Adak"},
    12: {"offset": -11, "text": "(UTC-11:00) Pacific/Midway"},
    13: {"offset": -12, "text": "(UTC-12:00)"},
    14: {"offset": 1, "text": "(UTC+1:00) Europe/Madrid"},
    15: {"offset": 2, "text": "(UTC+2:00) Europe/Kyiv"},
    16: {"offset": 3, "text": "(UTC+3:00) Africa/Kampala"},
    17: {"offset": 4, "text": "(UTC+4:00) Europe/Astrakhan"},
    18: {"offset": 5, "text": "(UTC+5:00) Asia/Karachi"},
    19: {"offset": 6, "text": "(UTC+6:00) Asia/Urumqi"},
    20: {"offset": 7, "text": "(UTC+7:00) Asia/Novokuznetsk"},
    21: {"offset": 8, "text": "(UTC+8:00) Asia/Shanghai"},
    22: {"offset": 9, "text": "(UTC+9:00) Asia/Khandyga"},
    23: {"offset": 10, "text": "(UTC+10:00) Australia/Lindeman"},
    24: {"offset": 11, "text": "(UTC+11:00) Australia/Sydney"},
    25: {"offset": 12, "text": "(UTC+12:00) Pacific/Fiji"},
  };
}

int getTimeZoneId(String? text) {
  Map<int, dynamic> timeZones = getTimeZones();

  return timeZones.entries
      .firstWhere(
        (entry) => entry.value["text"] == text,
        orElse: () => const MapEntry(-1, {}), // Retorna -1 si no se encuentra
      )
      .key;
}
