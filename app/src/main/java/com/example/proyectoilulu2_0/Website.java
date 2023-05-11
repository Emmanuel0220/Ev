package com.example.proyectoilulu2_0;

import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import java.util.List;

public class Website extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_website);
    }

    public void Ingremapa (View v){
        Intent intent = new Intent (Website.this, WebApi.class);
        startActivity( intent );
    }
    public void Ingrechat (View v){
        Intent intent = new Intent (Website.this, Chat.class);
        startActivity( intent );
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        boolean flag = false;
        MenuInflater menuInflater = null;
        flag = super.onCreateOptionsMenu(menu);
        menuInflater = getMenuInflater();
        menuInflater.inflate(R.menu.mi_menu, menu);
        return flag;

    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        String seleccion = null;
        switch(item.getItemId()){
            case R.id.MenuCerrarSesionrId:
                Intent intent1 = new Intent (Website.this, Login.class);
                startActivity( intent1 );
                break;
            case R.id.MenuBreakingApi:
                int numArchivo1 = getIntent().getExtras().getInt("numArchivo");
                int numLista1 = getIntent().getExtras().getInt("numLista");
                Intent intent2 = new Intent (Website.this, WebApi.class);
                intent2.putExtra("numArchivo", numArchivo1);
                intent2.putExtra("numLista", numLista1);
                startActivity( intent2 );
                break;
            case R.id.MenuNuevoId:
                int numArchivo2 = getIntent().getExtras().getInt("numArchivo");
                int numLista2 = getIntent().getExtras().getInt("numLista");
                Intent intent3 = new Intent (Website.this, EditList.class);
                intent3.putExtra("numArchivo", numArchivo2);
                intent3.putExtra("numContext", 1);
                intent3.putExtra("numLista", numLista2);
                startActivity( intent3 );
                break;
            default:
                seleccion = "sin opcion %s";
                Toast.makeText(getBaseContext(), seleccion, Toast.LENGTH_SHORT).show();
                break;
        }
        return super.onOptionsItemSelected(item);
    }
}

