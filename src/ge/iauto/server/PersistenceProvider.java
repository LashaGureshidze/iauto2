package ge.iauto.server;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class PersistenceProvider {

	public static EntityManagerFactory EMF = null;

	public synchronized static EntityManager createEM() {
		if (EMF == null) {
			EMF = Persistence.createEntityManagerFactory("IAUTO");
		}
		return EMF.createEntityManager();
	}
	
	public synchronized static void closeEM(){
		if(EMF != null){
			EMF.close();
			EMF = null;
		}
	}
}
