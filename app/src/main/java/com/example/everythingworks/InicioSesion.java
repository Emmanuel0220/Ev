package com.example.everythingworks;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class InicioSesion extends AppCompatActivity implements View.OnClickListener {
    Button inicia, registra;
    EditText eCorreo, eContraseña;
    Arreglo subir = new Arreglo();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_inicio);
        inicia=findViewById(R.id.bsube);
        inicia.setOnClickListener(this);

        registra=findViewById(R.id.bregistra);
        registra.setOnClickListener(this);

        eCorreo=findViewById(R.id.ecorreo);
        eContraseña=findViewById(R.id.econtraseña);
    }

    @Override
    public void onClick(View v) {
        String cadena = ((Button)v).getText().toString();
        if(cadena.equals("INICIA SESION")){
            if(eContraseña.equals("") || eCorreo.equals("")){
                Toast.makeText(this, "Debes llenar todos los campos",Toast.LENGTH_SHORT).show();
            } else {
                String encontrado= eCorreo.getText().toString();
                String contra= eContraseña.getText().toString();
                boolean permiso= subir.consultadatos(encontrado, contra);
                if(permiso){
                    Intent intet = new Intent(this, PantallaInicio.class);
                    startActivity(intet);
                }

            }
        } else if(cadena.equals("REGISTRATE")){
            Intent intet = new Intent(this, Registro.class);
            startActivity(intet);
        }
    }
}