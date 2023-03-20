package com.example.proyectoilulu2_0;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import androidx.appcompat.app.AppCompatActivity;

public class Chat extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_chat);
    }

    public void Chatre (View v){
        Intent intent = new Intent (Chat.this, Website.class);
        startActivity( intent );
    }
}
