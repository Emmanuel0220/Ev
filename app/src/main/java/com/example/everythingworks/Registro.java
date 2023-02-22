package com.example.everythingworks;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.Spinner;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class Registro extends AppCompatActivity implements View.OnClickListener {
    Arreglo subir = new Arreglo();
    Button inicia, registra, regresa;
    EditText eCorreo, eContraseña, eNombre;
    Spinner Spgrupo;
    String []trabajos = {"Selecciona un tipo de trabajo.","Mecanico","Cocinero","Electronico","Dibujante",
    "Transporte","Vendedor","Musico"};
    ArrayAdapter<String> ArOp;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registro);
        inicia=findViewById(R.id.binicia);
        inicia.setOnClickListener(this);

        registra=findViewById(R.id.bregistra);
        registra.setOnClickListener(this);

        regresa=findViewById(R.id.bregresa);
        regresa.setOnClickListener(this);

        eCorreo=findViewById(R.id.ecorreo);
        eContraseña=findViewById(R.id.econtraseña);
        eNombre = findViewById(R.id.enombre);

        Spgrupo = findViewById(R.id.cTipoVendedor);
        ArOp = new ArrayAdapter<>(this, android.R.layout.simple_spinner_item, trabajos);
        Spgrupo.setAdapter(ArOp);
        Spgrupo.setEnabled(false);
    }

    public void onRadioButtonClicked(View v) {
        String textito = ((RadioButton) v).getText().toString();
        if(textito.equals("Vendedor")){
            Spgrupo.setEnabled(true);
        }
    }

    @Override
    public void onClick(View v) {
        String cadena = ((Button)v).getText().toString();
        if(cadena.equals("INICIAR SESION")) {
            Intent intet = new Intent(this, InicioSesion.class);
            startActivity(intet);
        } else if(cadena.equals("REGISTRATE")){
            datos registro = new datos();
            registro.setNombre(eNombre.getText().toString());
            registro.setContraseña(eContraseña.getText().toString());
            registro.setCorreo(eCorreo.getText().toString());
            subir.altas(registro);
            Intent intet = new Intent(this, PantallaInicio.class);
            startActivity(intet);
        } else if(cadena.equals("REGRESA")){
            Intent intet = new Intent(this, MainActivity.class);
            startActivity(intet);
        }
    }
}
