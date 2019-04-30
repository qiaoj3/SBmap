package com.example.sbmap;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.location.Location;
import android.location.LocationManager;
import android.net.Uri;
import android.os.AsyncTask;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.google.gson.JsonObject;
import com.google.gson.JsonArray;
import java.net.URL;

public class fetchData extends AsyncTask<Void, Void, Void>  {

    String data = "";
    String image = "";
    double longitude;
    double latitude;
    String urlstring;
    public Void getlocation(double lo, double la) {
        this.longitude = lo;
        this.latitude = la;

        urlstring = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=" + longitude + "," + latitude + "&rankby=distance&keyword=library&key=AIzaSyDInXnKYcgupcj0ga5t6PQWYS5L4Vjcmak";

        return null;
    }




    Bitmap bmp = null;

    @Override
    protected Void doInBackground(Void... voids) {
        try {
            URL url = new URL(urlstring);
            JsonParser parser = new JsonParser();

            HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();

            JsonElement pdata = parser.parse(new InputStreamReader((InputStream) httpURLConnection.getContent()));
            data = "hehe nothing is open near you.";
            JsonObject root = pdata.getAsJsonObject();
            JsonArray results = root.get("results").getAsJsonArray();

            for (int i = 0; i < results.size(); i++) {
                if (results.get(i).getAsJsonObject().get("opening_hours").getAsJsonObject().get("open_now").getAsBoolean()) {
                    data = results.get(i).getAsJsonObject().get("name").getAsString() + " is currently open！\n";
                    double lat = results.get(i).getAsJsonObject().get("geometry").getAsJsonObject().get("location").getAsJsonObject().get("lat").getAsDouble();
                    double lng = results.get(i).getAsJsonObject().get("geometry").getAsJsonObject().get("location").getAsJsonObject().get("lng").getAsDouble();
                    image = "https://maps.googleapis.com/maps/api/staticmap?zoom=18&size=600x600&maptype=roadmap&markers=color:green%7Clabel:G%7C"+ lat + "," + lng + "&key=AIzaSyDInXnKYcgupcj0ga5t6PQWYS5L4Vjcmak";
                    InputStream in = new java.net.URL(image).openStream();
                    bmp = BitmapFactory.decodeStream(in);
                    break;
                }
            }


        } catch (java.io.IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    protected void onPostExecute(Void aVoid) {
        super.onPostExecute(aVoid);

        MainActivity.data.setText(this.data);
        if (bmp != null) {
            MainActivity.img.setImageBitmap(bmp);
        }



    }
}
