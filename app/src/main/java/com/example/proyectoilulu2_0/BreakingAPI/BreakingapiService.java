package com.example.proyectoilulu2_0.BreakingAPI;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;

public interface BreakingapiService {

    @GET("v1/quotes/8")
    Call<List<BreakingQuotes>> obtenerListaFrases();

}
