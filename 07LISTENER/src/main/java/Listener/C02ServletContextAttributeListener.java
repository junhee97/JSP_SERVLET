package Listener;

import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.annotation.WebListener;

@WebListener

public class C02ServletContextAttributeListener implements ServletContextAttributeListener {

	@Override
	public void attributeAdded(ServletContextAttributeEvent event) {
		System.out.println("[LISTENER] ServletContextAttributeListener.. add...");
	}

	@Override
	public void attributeRemoved(ServletContextAttributeEvent event) {
		System.out.println("[LISTENER] ServletContextAttributeListener.. remove...");
	}

	@Override
	public void attributeReplaced(ServletContextAttributeEvent event) {
		System.out.println("[LISTENER] ServletContextAttributeListener.. replace...");
	}

}
