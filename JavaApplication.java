import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Scanner;

/*  GROUP 5:
 * SAMIMA HASSAN 
 * DEFNE SAHAL 
 * ZEYNEP DILAY TOPTAS 
 * 
 */

public class JavaApplication {

	private static Connection connect = null;
	private static Statement statement = null;
	private static ResultSet resultset = null;

	final private static String host = "jdbc:postgresql://10.98.98.61:5432/group5";
	final private static String user = "group5";
	final private static String password = "pHrWjs8XwazhhMUZ";

	public static void main(String[] args) {
		try {

			char cont;
			/// connection of the database
			Connection connection = DriverManager.getConnection(host, user, password);
			System.out.println("JDBC ");
			System.out.println("connected to databse");
			Scanner kb = new Scanner(System.in);
			System.out.println("\t***********************************************");
			System.out.println(" \t\tWELCOME TO ONLINE MOVIE ");
			System.out.println("\t***********************************************");
			// if user wants to enetr the database should enter y
			System.out.print("     TO CONTINUE PRESS y , to exit press any ");
			Statement statement = connection.createStatement();
			ResultSet resultSet;
			cont = kb.next().charAt(0);
			// loop of the application
			while (cont == 'y') {
				// chose one of the options
				System.out.println("\t  for movies part enter m");
				System.out.println("\t  for actor part enter a ");
				System.out.println("\t  for user part enter u ");

				String key = kb.next();
				// *******************************************************movie part

				if (key.equalsIgnoreCase("m")) {
					// 8 options of the movie table
					System.out.println("## for all movies enter 1");
					System.out.println("## for adding a movie eneter 2");
					System.out.println("## for deleting enter delete 3 ");
					System.out.println("## for viewing a movie from specific country enter 4");
					System.out.println("## for rating a movie enter 5");
					System.out.println("## for movies cheapest and price less than 100 enter 6");
					System.out.println("## fro seeing all movies with their genre enter  7");
					System.out.println("## for updating the price of the movie enter 8");
					String mkey;
					mkey = kb.next();
					mkey.toLowerCase();
					// *************************************case 1
					switch (mkey) {

					case "1": {
						System.out.println("***************************************************************");
						System.out.printf("%s\t   %s\t \t \t \t %s\t \n", "ID ", "TITLE", "PRICE");
						resultSet = statement.executeQuery("SELECT*FROM public.movie");
						int i = 1;
						while (resultSet.next()) {

							System.out.printf("%d\t    %-30s \t    %d \n", resultSet.getInt("movie_id"),
									resultSet.getString("title"), resultSet.getInt("price"));
						}
						break;
					}
					// **************************************case 2 (insert)
					// to add movie to the movie table
					case "2": {
						System.out.println("***************************************************************");
						String title, country;
						int duration, price, year;
						System.out.println("enter the title of movie in one word");
						title = kb.next();
						System.out.println("\nenter the duration of movie");
						duration = kb.nextInt();
						System.out.println("\nenter the year which movie was realsed");
						year = kb.nextInt();
						System.out.println("\nenter the price of the movie ");
						price = kb.nextInt();
						System.out.println("\nenter the country of movie");
						country = kb.nextLine();
						statement.executeUpdate("INSERT INTO movie " + "(title, country, duration, year_release, price)"
								+ " values ('" + title + "'," + "'" + country + "'," + duration + "," + year + ","
								+ price + ")");
						break;
					}
					// delete a movie from the movie table
					case "3": {
						System.out.println("***************************************************************");
						System.out.print("To delete the movie eneter the id of it ");
						int id = kb.nextInt();
						String sql = "DELETE FROM movie where movie_id =" + id;

						statement.executeUpdate(sql);
						break;
					}
					// listing movie from a specific country
					case "4": {
						System.out.println("***************************************************************");
						System.out.println("To see the movie from a spefic country enter name");
						String country = kb.next();
						String sql = "SELECT*FROM movie where country like '%" + country + "%'";
						resultSet = statement.executeQuery(sql);
						System.out.printf("%s\t   %s\t \t \t \t %s\t \n", "ID ", "TITLE", "PRICE");
						while (resultSet.next()) {

							System.out.printf("%d\t    %-30s \t    %d \n", resultSet.getInt("movie_id"),
									resultSet.getString("title"), resultSet.getInt("price"));
						}
						break;
					}
					// insert a rate in for movie in the rating table
					case "5": {
						System.out.println("***************************************************************");
						System.out.println("To rate the movie please enter the following ");
						System.out.println("enter ID");
						int id = kb.nextInt();
						System.out.println("enter movie id ");
						int movie = kb.nextInt();
						System.out.println("enter year");
						int year = kb.nextInt();
						System.out.println("enter the star from1 to 10 you want to give to movie");
						int rate = kb.nextInt();
						String sql = "INSERT INTO rating (movie_id, user_id, rate_year, rate_star)" + " VALUES(" + movie
								+ "," + id + "," + year + "," + rate + ")";
						statement.executeUpdate(sql);
						System.out.println("**** your rate is added ****");

					}
					// list of the movies which has price less than 100

					case "6": {
						System.out.println("***************************************************************");
						String sql = "select*from movie where price <100 order by price asc";
						resultSet = statement.executeQuery(sql);
						System.out.printf("%s\t   %s\t \t \t \t %s\t \n", "ID ", "TITLE", "PRICE");
						while (resultSet.next()) {

							System.out.printf("%d\t    %-30s \t    %d \n", resultSet.getInt("movie_id"),
									resultSet.getString("title"), resultSet.getInt("price"));
						}
						break;
					}
					// list of movies with their genre
					case "7": {
						System.out.println("***************************************************************");
						String sql = "select*from movie_with_genre;";

						resultSet = statement.executeQuery(sql);
						System.out.printf("%s\t  \t \t \t      %s\t \n", "TITLE", "GENRE");
						while (resultSet.next()) {

							System.out.printf("%-20s \t              %-30s \t \n", resultSet.getString("TITLE"),
									resultSet.getString("GENRE"));
						}
						break;
					}

					// updating the price of the movie
					case "8": {
						System.out.println("***************************************************************");
						System.out.print("eneter the id of movie ");
						int id = kb.nextInt();
						System.out.print("Enter the new price");
						int newPrice = kb.nextInt();
						String sql = "update movie set price=" + newPrice + " where movie_id=" + id;

						statement.executeUpdate(sql);
						System.out.println("****price updated****");
						break;

					}

					}

				}
				// part2
				// ************************************************* actor part
				if (key.equalsIgnoreCase("a")) {
					String akey;
					System.out.println("to view all actors country and their movie enter 1");
					System.out.println("to view all actors from a specific country enter 2");
					System.out.println("to add an actor to the list enter 3");
					System.out.println("to remove an actor from the list enter 4");

					akey = kb.next();
					akey.toLowerCase();
					switch (akey) {
					// list all the actors
					case "1": {
						System.out.println("***************************************************************");
						String sql = "select*from actor_with_films";
						resultSet = statement.executeQuery(sql);
						System.out.printf("%s\t  \t   %s\t        %s\t \n", "NAME", "COUNTRY", "MOVIE");
						while (resultSet.next()) {

							System.out.printf("%-10s \t   %-13s\t   %-10s\t \n", resultSet.getString("NAME"),
									resultSet.getString("COUNTRY"), resultSet.getString("MOVIE"));
						}
						break;
					}

					/// list of actors from a specific country
					case "2": {
						System.out.println("***************************************************************");
						System.out.print("Enter country name : ");
						String country;
						country = kb.next();
						String sql = "select f_name ,country from actor where country ='" + country + "'";
						resultSet = statement.executeQuery(sql);
						System.out.printf("%s\t  \t     %s\t   \n", "NAME", "COUNTRY");
						while (resultSet.next()) {
							System.out.printf("%-13s \t      %-15s\t  \n", resultSet.getString("f_name"),
									resultSet.getString("country"));

						}
						break;
					}
					// adding an actor to actor table

					case "3": {
						System.out.println("***************************************************************");
						String fname, lname, country, gender;
						System.out.print("Enter actor first name");
						fname = kb.next();
						System.out.print("Enter actor last name");
						lname = kb.next();
						System.out.print("Enter country where actor is from");
						country = kb.next();
						System.out.print("Enter gener female or male ");
						gender = kb.next();
						String sql = "INSERT INTO actor (f_name, l_name, country, gender)" + " VALUES('" + fname + "','"
								+ lname + "','" + country + "','" + gender + "')";
						statement.executeUpdate(sql);
						System.out.println("**** actor is added ****");
						break;
					}
					// deleting an actor from the actor table

					case "4": {
						System.out.println("***************************************************************");
						System.out.print("To delete an actor from the list enter his/her ID");
						int id;
						id = kb.nextInt();
						String sql = "DELETE FROM actor where actor_id =" + id;
						statement.executeUpdate(sql);
						System.out.println("**** actor with ID " + id + " is removed ****");
						break;
					}

					}
				}
				// part 3
				// ************************************************* user part
				if (key.equalsIgnoreCase("u")) {
					System.out.println("For registering please enter 1");
					System.out.println("For subscribing  please enter 2");
					System.out.println("To view all users with subscription enter 3  ");
					String ukey;
					ukey = kb.next();
					switch (ukey) {
					// adding a user to the users table
					case "1": {
						System.out.println("***************************************************************\n");
						String fname, lname, country, password, email;
						System.out.println("Enter your first name :");
						fname = kb.next();
						System.out.print("Enter your last name ");
						lname = kb.next();
						System.out.print("Enter your country ");
						country = kb.next();
						System.out.print("Enter your password");
						password = kb.next();
						System.out.print("Enter your email");
						email = kb.next();
						String sql = "INSERT INTO users (f_name, l_name, country, user_password, email)" + "VALUES('"
								+ fname + "','" + lname + "', '" + country + "', '" + password + "', '" + email + "')";
						statement.executeUpdate(sql);
						System.out.println("\n*** you are registered ***");
						String sql2 = "select user_id from users where f_name ='" + fname + "'AND l_name = '" + lname
								+ "' AND country ='" + country + "' AND user_password ='" + password + "' AND email ='"
								+ email + "'";
						resultSet = statement.executeQuery(sql2);
						while (resultSet.next()) {

							System.out.printf("\n *** your id is %d ***", resultSet.getInt("user_id"));
						}
						break;

					}
					// adding subscription to the subscription table
					case "2": {
						System.out.println("***************************************************************\n");
						System.out.println(" choose one of the subscription");
						System.out.print("for weekly 1\n for monthly 2 \n for annual 3\n");
						String choice = kb.next();
						int price = 0;
						String type = "";
						if (choice.equalsIgnoreCase("1")) {
							price = 100;
							type = "weekly";
						}
						if (choice.equalsIgnoreCase("2")) {
							price = 300;
							type = "monthly";
						}
						if (choice.equalsIgnoreCase("3")) {
							price = 500;
							type = "annual";
						}
						System.out.print("Enter your payment id\n ");
						int paymentid = kb.nextInt();
						DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd ");
						LocalDateTime now = LocalDateTime.now();
						String date = dtf.format(now);
						String sql = "INSERT INTO subscriptions (price, sub_date, sub_type, payment_id) " + "VALUES("
								+ price + ", '" + date + "', '" + type + "'," + paymentid + ")";
						statement.executeUpdate(sql);
						System.out.print("*** you have subsrcibe to " + type + " package");
						break;
					}

					// list of all users who has subscription
					case "3": {
						System.out.println("***************************************************************\n");

						String sql = "select*from user_with_subscription";
						System.out.printf("%s\t  \t   %s\t        %s\t \n", "F_NAME", "L_NAME", "ID");
						resultSet = statement.executeQuery(sql);
						while (resultSet.next()) {
							System.out.printf("%-10s \t   %-13s\t%-10s\t \n", resultSet.getString("f_name"),
									resultSet.getString("l_name"), resultSet.getInt("sub_id"));

						}
						break;

					}

					}
				}

				System.out.print("\n\nto continue enter y ");
				cont = kb.next().charAt(0);
			}
		} catch (SQLException e) {
			System.out.println("connection filaed ");
			e.printStackTrace();
		}

	}
}