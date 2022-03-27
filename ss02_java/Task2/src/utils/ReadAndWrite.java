package utils;
import java.io.*;
import java.util.Collection;
public class ReadAndWrite {
    /**Phương thức để ghi file
     * collection: là nhưng collection để lư trử những đối tượng Customer, Employee,..
     * diaChi: chính là địa chỉ để lưu file csv
     */
    public static void write(Collection collection, String diaChi) {
        File file =  new File(diaChi);

        if(!file.exists()) { // kiểm tra file. nếu chưa tồn tại thì tạo mới
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        // Khai báo đối tượng của FileOutputStream và ObjectOutputStream
        FileOutputStream fileOutputStream = null;
        ObjectOutputStream objectOutputStream = null;

        try {
            fileOutputStream = new FileOutputStream(file);
            objectOutputStream = new ObjectOutputStream(fileOutputStream);
            objectOutputStream.writeObject(collection);
        } catch (FileNotFoundException e) {
            System.out.println("Lỗi file không tồn tại" + e);
        } catch (Exception e) {
            System.out.println("Lỗi viết" + e);
            /*finally: luôn thực thiện đóng file sau khi xử lí xong. */
        } finally {
            try {
                fileOutputStream.close();
                objectOutputStream.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    public static Object read(String diaChi) {
        FileInputStream fileInputStream = null;
        ObjectInputStream objectInputStream = null;
        Object object = null ;
        try {
            fileInputStream = new FileInputStream(diaChi);
            objectInputStream = new ObjectInputStream(fileInputStream);
            object = objectInputStream.readObject();
            return object;
        } catch (Exception e) {
            System.out.println("Lỗi đọc" + e);
        }
        return null;
    }
}
