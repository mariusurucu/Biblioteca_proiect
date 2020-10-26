/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package biblioteca;

import javafx.application.Application ;
import javafx.scene.control.TableView ;
import javafx.scene.control.TableColumn ;
import javafx.scene.control.cell.PropertyValueFactory ;
import javafx.scene.layout.BorderPane ;
import javafx.scene.Scene ;
import javafx.stage.Stage ;

public class Biblioteca extends Application {
   

    @Override
    public void start(Stage primaryStage) throws Exception {
        

        TableView personTable = new TableView<>();
        TableColumn Id = new TableColumn("autorid");
        Id.setCellValueFactory(new PropertyValueFactory("autorid"));
        TableColumn numeautor = new TableColumn("Autor Nume");
        numeautor.setCellValueFactory(new PropertyValueFactory<>("numeautor"));
        TableColumn prenumeautor = new TableColumn("Autor Prenume");
        prenumeautor.setCellValueFactory(new PropertyValueFactory<>("prenumeautor"));
        TableColumn tara = new TableColumn("Tara de Origine");
        tara.setCellValueFactory(new PropertyValueFactory<>("tara"));

        personTable.getColumns().addAll(Id, numeautor, prenumeautor,tara);

        personTable.getItems().addAll("1", "Salvatore", "Moji", "Spania");

        BorderPane root = new BorderPane();
        root.setCenter(personTable);
        Scene scene = new Scene(root, 600, 400);
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    @Override
    public void stop() throws Exception {
        //if (dataAccessor != null) {
           // dataAccessor.shutdown();
        //}
    }

    public static void main(String[] args) {
        launch(args);
    }
}