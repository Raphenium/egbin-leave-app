/*
 * package net.kzn.onlineshopping.security;
 * 
 * import java.util.List;
 * 
 * import javax.servlet.http.HttpSessionBindingEvent; import
 * javax.servlet.http.HttpSessionBindingListener;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Component;
 * 
 * @Component public class LoggedUser implements HttpSessionBindingListener {
 * 
 * private String username;
 * 
 * @Autowired private ActiveUserStore activeUserStore;
 * 
 * public LoggedUser() { }
 * 
 * public LoggedUser(String username, ActiveUserStore activeUserStore) {
 * this.username = username; this.activeUserStore = activeUserStore; }
 * 
 * @Override public void valueBound(HttpSessionBindingEvent event) {
 * List<String> users = activeUserStore.getUsers(); LoggedUser user =
 * (LoggedUser) event.getValue(); if (!users.contains(user.getUsername())) {
 * users.add(user.getUsername()); } }
 * 
 * @Override public void valueUnbound(HttpSessionBindingEvent event) {
 * List<String> users = activeUserStore.getUsers(); LoggedUser user =
 * (LoggedUser) event.getValue(); users.remove(user.getUsername()); }
 * 
 * public String getUsername() { return username; }
 * 
 * public void setUsername(String username) { this.username = username; } }
 */