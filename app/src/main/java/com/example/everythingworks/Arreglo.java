package com.example.everythingworks;

import java.util.ArrayList;

public class Arreglo {
    ArrayList<datos> alistito = new ArrayList();

    public void altas(datos objeto){
        alistito.add(objeto);
    }

    public Boolean consultadatos(String correo, String contraseña) {
        datos objeto;
        String CORR;
        String CONT;
        boolean cadena = false;
        for (int i = 0; i<alistito.size(); i++) {
            objeto=alistito.get(i);
            CORR = objeto.getCorreo();
            CONT = objeto.getContraseña();
            if(CORR.equals(correo) && CONT.equals(contraseña)){
                cadena=true;
            }
            else{
                cadena=false;}
        }
        return cadena;
    }
}
