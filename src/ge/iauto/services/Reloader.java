package ge.iauto.services;

import java.util.Timer;
import java.util.TimerTask;

public class Reloader {
	private static Timer timer;
	
	private static TimerTask timerTask;
	
	public static void start(int secunds) {
		timer = new Timer("Currency Updater");
		timerTask = new TimerTask() {
			@Override
			public void run() {
				try {
					CurrencyConvertor.updateCurrencies();
				} catch (Throwable t) {
				
				}
			}
		};
		timer.schedule(timerTask, 0, secunds * 1000);
	}
	
	public static void shutdown() {
		timer.cancel();
		timerTask.cancel();
	}
}
