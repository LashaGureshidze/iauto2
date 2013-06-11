package ge.iauto.services;

import ge.iauto.server.PersistenceService;

import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

public class CarExpirationTimeChecker {
private static Timer timer;
	private static int exp = 20;

	private static TimerTask timerTask;
	
	public static void start(int secunds) {
		timer = new Timer("Car expiration checker");
		timerTask = new TimerTask() {
			@Override
			public void run() {
				try {
					PersistenceService service = new PersistenceService();
					service.checkCarExpiration(new Date(), exp);
					
				} catch (Throwable t) {
				//	System.out.println("carExpirationTimeChecker " + t.toString());
					t.printStackTrace();
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
