import com.google.gson.Gson;

String jsonHours = "{\"Воскресенье\":\"10:00 - 21:00\",\"Вторник\":\"10:00 - 21:00\",\"Понедельник\":\"10:00 - 23:00\",\"Пятница\":\"10:00 - 14:00\",\"Среда\":\"11:00 - 19:00\",\"Суббота\":\"10:00 - 22:00\",\"Четверг\":\"10:00 - 22:00\"}";
        Hours hours = new Gson().fromJson(jsonHours, Hours.class);
        System.out.println("Today's hours: " + hours.getTodaysHours());