package com.example.everythingworks;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {
    Button inicio, registro, conocer;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        setTheme(R.style.splashtheme);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        inicio=findViewById(R.id.binicia);
        inicio.setOnClickListener(this);

        registro=findViewById(R.id.bregistra);
        registro.setOnClickListener(this);

        conocer=findViewById(R.id.bconoce);
        conocer.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        String cadena = ((Button)v).getText().toString();
        if(cadena.equals("INICIA SESION")){
            Intent intet = new Intent(MainActivity.this, InicioSesion.class);
            startActivity(intet);
        } else if(cadena.equals("REGISTRATE")){
            Intent intet = new Intent(MainActivity.this, Registro.class);
            startActivity(intet);
        } else if(cadena.equals("CONOCENOS")){

        }
    }
}