package com.example.proyectoilulu2_0;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import androidx.appcompat.app.AppCompatActivity;

public class Mapa extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_mapa);
    }

    public void Mapare (View v){
        Intent intent = new Intent (Mapa.this, Website.class);
        startActivity( intent );
    }
}
