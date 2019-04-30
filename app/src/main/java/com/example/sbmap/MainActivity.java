package com.example.sbmap;

import android.Manifest;
import android.annotation.SuppressLint;
import android.content.Context;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.support.design.animation.ImageMatrixProperty;
import android.support.v4.app.ActivityCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;



public class MainActivity extends AppCompatActivity {

    double longitude;
    double latitude;
    Button click;
    public static ImageView img;
    public static TextView data;
    @SuppressLint("MissingPermission")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        ActivityCompat.requestPermissions(this,new String[]{Manifest.permission.ACCESS_FINE_LOCATION}, 1);
        final LocationManager lm = (LocationManager) getSystemService(Context.LOCATION_SERVICE);
        final LocationListener locationListener = new LocationListener() {
             public void onLocationChanged(Location location) {
                longitude = location.getLongitude();
                latitude = location.getLatitude();
            }

            @Override
            public void onStatusChanged(String provider, int status, Bundle extras) {

            }

            @Override
            public void onProviderEnabled(String provider) {

            }

            @Override
            public void onProviderDisabled(String provider) {

            }
        };

        lm.requestLocationUpdates(LocationManager.GPS_PROVIDER, 1000, 1, locationListener);

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        click = (Button) findViewById(R.id.button);
        data = (TextView) findViewById(R.id.textView3);
        img = (ImageView) findViewById(R.id.imageView);
        click.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                Location location = lm.getLastKnownLocation(LocationManager.GPS_PROVIDER);
                double longitude = 40.108386;
                double latitude = -88.2282287;
                if (location != null) {
                    if (location.getLongitude() != 0.0) {
                        longitude = location.getLongitude();
                    }
                    if (location.getLatitude() != 0.0) {
                        latitude = location.getLatitude();
                    }
                }


                fetchData process = new fetchData();
                process.getlocation(longitude, latitude);
                process.execute();
            }
        });

    }
}
