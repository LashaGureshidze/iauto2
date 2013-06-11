package ge.iauto.services;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.*;

public class CurrencyConvertor {
	private static double usdCurrency = 1.0;
	
	private static double eurCurrency = 1.0;
	/**
	 * Converts USD$ to Georgian GEL
	 * @return
	 */
	public static double UsdToGel(){
		return usdCurrency;
	}
	/**
	 * Converts USD$ to EUR
	 * @return
	 */
	public static double UsdToEur(){
		return getFourDecimal(usdCurrency / eurCurrency);
	}
	/**
	 * Converts EUR to USD
	 * @return
	 */
	public static double EurToUsd(){
		return getFourDecimal(eurCurrency / usdCurrency);
	}
	/**
	 * Converts EUR to Georgian GEL
	 * @return
	 */
	public static double EurToGel(){
		return eurCurrency;
	}
	/**
	 * Converts Georgian GEL to EUR
	 * @return
	 */
	public static double GelToEur(){
		return getFourDecimal(1 / eurCurrency);	
	}
	/**
	 * Converts Georgian GEL to USD
	 * @return
	 */
	public static double GelToUsd(){
		return getFourDecimal(1 / usdCurrency);	
	}
	/*
	 * parses double number, four decimal
	 */
	private static double getFourDecimal(double value){
		int n = (int)(value * 10000);
		return (double)n / 10000;
	}

//updates currencies
	public static void updateCurrencies(){
	// ==========get input Stream ========
		System.out.println("starting update currencies");
		String result = null;
		try {
			InputStream in = new URL("http://www.nbg.ge/rss.php").openStream() ;
			BufferedReader reader = new BufferedReader(new InputStreamReader(in));
			StringBuilder builder = new StringBuilder();
			String line;
			while((line = reader.readLine()) != null){
				builder.append(line);
			}
			result = builder.toString();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	//==================parse data============
		eurCurrency = parseCurrency(result, "ევრო");
		usdCurrency = parseCurrency(result, "აშშ დოლარი");
		System.out.println(usdCurrency);
		System.out.println(eurCurrency);
		System.out.println("finished updating currencies");
	}
	
	private static double parseCurrency(String stream,String name){
		int index = stream.indexOf(name);
		if (index == -1) return 1.0;
		int startIndex = stream.indexOf("<td>", index) + 4;
		String cur = stream.substring(startIndex, startIndex + 6);
		double currency;
		try{
			currency = Double.parseDouble(cur);
		}catch(Exception e){
			System.out.println("currency parsing problem");
			return 1.0;
		}
		return currency;
	}
}
