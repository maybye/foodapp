package com.android.foodorderapp;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;

import com.android.foodorderapp.adapters.RestaurantListAdapter;
import com.android.foodorderapp.model.RestaurantModel;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import android.util.Log;

public class MainActivity extends AppCompatActivity implements RestaurantListAdapter.RestaurantListClickListener {

    private static final String TAG = "MainActivity";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ActionBar actionBar = getSupportActionBar();
        if (actionBar != null) {
            actionBar.setTitle("Restaurant List");
        }

        new FetchRestaurantDataTask().execute();
    }

    private void initRecyclerView(List<RestaurantModel> restaurantModelList) {
        RecyclerView recyclerView = findViewById(R.id.recyclerView);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        RestaurantListAdapter adapter = new RestaurantListAdapter(restaurantModelList, this);
        recyclerView.setAdapter(adapter);
    }

    @Override
    public void onItemClick(RestaurantModel restaurantModel) {
        Intent intent = new Intent(MainActivity.this, RestaurantMenuActivity.class);
        intent.putExtra("RestaurantModel", restaurantModel);
        startActivity(intent);
    }

    private class FetchRestaurantDataTask extends AsyncTask<Void, Void, List<RestaurantModel>> {

        @Override
        protected List<RestaurantModel> doInBackground(Void... voids) {
            try {
                URL url = new URL("http://172.20.10.2:5555/restaurants");
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                connection.setRequestMethod("GET");
                connection.connect();

                BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                StringBuilder sb = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    sb.append(line);
                }

                reader.close();
                connection.disconnect();

                String jsonResponse = sb.toString();

                Log.i("Main", jsonResponse);
                Gson gson = new Gson();
                Type listType = new TypeToken<List<RestaurantModel>>() {}.getType();
                List<RestaurantModel> restaurantList = gson.fromJson(jsonResponse, listType);

                // Логируем значение ключа `hours` для каждого ресторана
                for (RestaurantModel restaurant : restaurantList) {
                    String hoursJson = gson.toJson(restaurant.getHours());
                    Log.i("Main", "Hours for " + restaurant.getName() + ": " + hoursJson);
                }
                return new Gson().fromJson(jsonResponse, listType);

            } catch (Exception e) {
                Log.e(TAG, "Error fetching restaurant data", e);
                return null;
            }
        }

        @Override
        protected void onPostExecute(List<RestaurantModel> restaurantModelList) {
            if (restaurantModelList != null) {
                for (RestaurantModel restaurant : restaurantModelList) {
                    Log.d(TAG, "Restaurant: " + restaurant.getName() + ", Today's Hours: " + restaurant.getHours().getTodaysHours());
                }
                initRecyclerView(restaurantModelList);
            }
        }
    }
}
