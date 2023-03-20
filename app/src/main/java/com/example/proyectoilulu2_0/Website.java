package com.example.proyectoilulu2_0;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import androidx.appcompat.app.AppCompatActivity;

public class Website extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_website);
    }

    public void Ingremapa (View v){
        Intent intent = new Intent (Website.this, Forgotpass.class);
        startActivity( intent );
    }
    public void Ingrechat (View v){
        Intent intent = new Intent (Website.this, Chat.class);
        startActivity( intent );
    }
}
