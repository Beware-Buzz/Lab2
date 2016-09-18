#!/bin/bash
CITY_URL="http://pogoda.by/26850/"
curl $CITY_URL 2>/dev/null \
| sed -nre '/section higher/,/мм рт. ст./p'\
| sed -r '/section higher|cloudness|wicon wind|crumb|scity|\/div|value m_temp f|m_wind mih|m_wind kmh|png|\/dl class="temp|wicon barp|dt/d'\
| sed -r 's/(.*)class="type(.*)>(.*)<\/h2>/Город: \3/'\
| sed -r 's/(.*)<dd(.*)td>(.*)<\/td(.*)\/dd>/Погода: \3/'\
| sed -r 's/(.*)<dd class=(.*)>(.*)<span class="meas(.*)span><\/dd>/Температура воздуха: \3 C/'\
| sed -r 's/(.*)value m_wind ms(.*)>(.*)<span class="unit">(.*)<\/span><\/dd>/Ветер: \3 \4/'\
| sed -r 's/(.*)value m_press torr(.*)>(.*)<(.*)>(.*)<\/span><\/dd>/Давление: \3 \5/'
