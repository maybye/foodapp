package com.android.foodorderapp.model;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class Hours {

    String Воскресенье;
    String Понедельник;
    String Вторник;
    String Среда;
    String Четверг;
    String Пятница;
    String Суббота;

    public String getTodaysHours() {
        // Получаем текущую дату и день недели на русском языке
        Calendar calendar = Calendar.getInstance();
        Date date = calendar.getTime();
        String day = new SimpleDateFormat("EEEE", new Locale("ru")).format(date);

        // Возвращаем расписание на текущий день недели
        switch (day) {
            case "Воскресенье":
                return this.Воскресенье;
            case "Понедельник":
                return this.Понедельник;
            case "Вторник":
                return this.Вторник;
            case "Среда":
                return this.Среда;
            case "Четверг":
                return this.Четверг;
            case "Пятница":
                return this.Пятница;
            case "Суббота":
                return this.Суббота;
            default:
                return null;
        }
    }
}
