
package dao;

import context.DBContext;
import entity.Account;
import entity.Cart;
import entity.Category;
import entity.Order;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    //hiển thị all product, all category, search, newest product
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getTop3() {
        List<Product> list = new ArrayList<>();
        String query = "select top 3 * from product";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getNext3Product(int amount) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT *\n"
                + "  FROM product\n"
                + " ORDER BY id\n"
                + "OFFSET ? ROWS\n"
                + " FETCH NEXT 3 ROWS ONLY";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductByCID(String cid) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "where cateID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductBySellID(int id) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "where sell_ID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "where [name] like ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Product getProductByID(String id) {
        String query = "select * from product\n"
                + "where id = ?";
        try {
            Connection connection = new DBContext().getConnection();//mo ket noi voi sql
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, id);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                return new Product(resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getDouble(4),
                        resultSet.getString(5),
                        resultSet.getString(6));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from Category";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //newest
    public Product getLast() {
        String query = "select top 1 * from product\n"
                + "order by id desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    
    //Login, kiểm tra tk, signup, delete acc
    public Account login(String user, String pass) {
        String query = "select * from [Account] a where a.[user] = '" + user
                + "'and a.[pass] = '" + pass + "'";
        try {
            PreparedStatement ps = new DBContext().getConnection()
                                                  .prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                
                int uid = rs.getInt(1);
                String username = rs.getString(2);
                String password = rs.getString(3);
                int isSell = rs.getInt(4);
                int isAdmin = rs.getInt(5);
                
                return new Account(uid, user, pass, isSell, isAdmin);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Account checkAccountExist(String user) {
        String query = "select * from account\n"
                + "where [user] = ?\n";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void singup(String user, String pass) {
        String query = "insert into account\n"
                + "values(?,?,1,0)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
       public List<Account> getSellAccount() {
        
        List<Account> list = new ArrayList<>();
        
        String query = "SELECT * FROM [Account] a WHERE a.isSell = 1;";
        try {
            PreparedStatement ps = new DBContext().getConnection()
                                                  .prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                
                Account a = new Account();
                
                a.setId(rs.getInt(1));
                a.setUser(rs.getString(2));
                a.setPass(rs.getString(3));
                a.setIsSell(1);
                a.setIsAdmin(0);
                
                list.add(a);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void deleteAccount(int uid) {
        String query = "delete from [Account]\n"
                + "where [uId] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, uid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void editAccount(String username, String password) {
        String q = "update [Account] set [pass]=" + password + ""
                + "where [Account].[user] = '" + username + "';";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(q);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    ////////////
    
    
    //Thêm, sửa, xóa product
    public void deleteProduct(String pid) {
        String query = "delete from product\n"
                + "where id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertProduct(String name, String image, String price,
            String title, String description, String category, int sid) {
        String query = "INSERT [dbo].[product] \n"
                + "([name], [image], [price], [title], [description], [cateID], [sell_ID])\n"
                + "VALUES(?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, description);
            ps.setString(6, category);
            ps.setInt(7, sid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void editProduct(String name, String image, String price,
            String title, String description, String category, String pid) {
        String query = "update product\n"
                + "set [name] = ?,\n"
                + "[image] = ?,\n"
                + "price = ?,\n"
                + "title = ?,\n"
                + "[description] = ?,\n"
                + "cateID = ?\n"
                + "where id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, description);
            ps.setString(6, category);
            ps.setString(7, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    ///Xử lý Cart 
    //(ordered = 0)
    //khởi đầu của Cart
     public void orderCart(Account a) {
//        delete from [dbo].[Cart] where exists (
//                select oid from [Order] o 
//                where o.oId = 6 
//                and o.oId = [dbo].[Cart].[oId]
//        );
        String q = "update [Cart] \n" +
                    "set [ordered] = 0\n" +
                    "where [Cart].[uid] = " + a.getId() + ";";
        try {
            Connection conn = new DBContext().getConnection();//mo ket noi voi sql
            PreparedStatement ps = conn.prepareStatement(q);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
    public Cart getCart(Account a) {
        String query = "select c.[uid], c.[oid], o.[pid], o.[amount], c.[ordered]"
                     + "FROM Wish.dbo.[Order] o INNER JOIN Wish.dbo.[Cart] c "
                     + "ON o.oId = c.oId "
                     + "WHERE c.[uid] = ? and c.[ordered] = 0;";
        try {
            Connection conn = new DBContext().getConnection();//mo ket noi voi sql
            PreparedStatement ps = conn.prepareStatement(query);
            System.out.println("DEBUG:" + a);
            ps.setInt(1, a.getId());
            ResultSet rs = ps.executeQuery();
            Cart c = new Cart();
            while (rs.next()) {
                int oid = rs.getInt(2);
                int amount = rs.getInt(4);
                Order order = new Order();
                order.setOid(oid);
                
                Product p = this.getProductByID(String.valueOf(rs.getInt(3)));
                
                if (p == null) {
                    continue;
                }
                order.setProduct(p);
                order.setAmount(amount);
                order.setOrderStatus(rs.getInt(5));
                
                c.add(order);
            }
            System.out.println("CART: " + c.getOrders().size());
            if (c.getOrders().isEmpty()) {
                return null;
            }
            
            return c;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public void addProductToCart(Account a, Product p, int amount) {
        Cart c = this.getCart(a);
        if (c == null || c.getOrders().isEmpty()) {
            this.addNewProductToCart(a, p, amount);
            return;
        } 
        
        for (Order o : c.getOrders()) {
            if (o.getProduct().getId() == p.getId()) {
                this.increaseAmountOrder(o, amount);
                return;
            }
        }
        
        this.addNewProductToCart(a, p, amount);
        
    }
    
    public void addNewProductToCart(Account a, Product p, int amount) {
        //      1. Add product into [Order]
        //      2. link the account to order in [Cart]
        String query = "insert into [dbo].[Order] (pId, amount) values(?,?)";  
        try {
            Connection conn = new DBContext().getConnection();//mo ket noi voi sql
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, p.getId());
            ps.setInt(2, amount);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        query = "select [oid] from [Order] where oid=("
                + "select max([oid]) from [Order]);";
        int oid = -1;
        try {
            PreparedStatement ps = new DBContext().getConnection()
                                                  .prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                oid = rs.getInt(1);
                System.out.println("GET oId = " + oid);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        if (oid == -1) {
            System.err.println("Failed to Add");
            return;
        }
        
        query = "insert into [dbo].[Cart] values(?,?,0)";   
        try {
            Connection conn = new DBContext().getConnection();//mo ket noi voi sql
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, a.getId());
            ps.setInt(2, oid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void increaseOrder(Account a, int oid) {
        Cart c = this.getCart(a);
        
        for (Order o : c.getOrders()) {
            if (o.getOid() == oid) {
                this.increaseAmountOrder(o, 1);
                return;
            }
        }
        
    }

    public void increaseAmountOrder(Order o, int amount) {
        int q = this.getQuantity(o.getOid());
        System.out.println("DEBUG: quantity = " + q);
        this.editQuantity(o.getOid(), (q + amount));
    }
    
    //lấy ra amount
    public int getQuantity(int oid) {
        String q = "select amount from [Order] o where o.oid = " 
                + String.valueOf(oid) + ";";
        try {
            PreparedStatement ps = new DBContext().getConnection()
                                                  .prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int t = rs.getInt(1);
                System.out.println("DEBUG: quantity(" + oid +"): " + t);
                return t;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    //edit amount
    public void editQuantity(int oid, int quantity) {
        String q = "update [Order] set amount = " + String.valueOf(quantity)
                + " where oid = " + String.valueOf(oid);
        try {
            PreparedStatement ps = new DBContext().getConnection()
                                                  .prepareStatement(q);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void decreaseOrder(Account a, int oid) {
        Cart c = this.getCart(a);
        
        for (Order o : c.getOrders()) {
            if (o.getOid() == oid) {
                
                if (this.getQuantity(oid) == 1) {
                    this.deleteProductFromCart(o.getProduct().getId());
                } else {
                    this.increaseAmountOrder(o, -1);
                }
                
            }
        }
        
    }
    
     public void deleteProductFromCart(int pid) {
//        delete from [dbo].[Cart] where exists (
//                select oid from [Order] o 
//                where o.oId = 6 
//                and o.oId = [dbo].[Cart].[oId]
//        );
        String q = "delete from [Cart] where exists ("
                + "select oid from [Order] o "
                + "where o.pId = " + String.valueOf(pid)
                + "and o.oId = [Cart].[oId]);";
        try {
            Connection conn = new DBContext().getConnection();//mo ket noi voi sql
            PreparedStatement ps = conn.prepareStatement(q);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        q = "delete from [dbo].[Order] where [dbo].[Order].pID = ?;";
        
        try {
            Connection conn = new DBContext().getConnection();//mo ket noi voi sql
            PreparedStatement ps = conn.prepareStatement(q);
            ps.setInt(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }    
    
    /////////   
    //Phục vụ view order
    //(ordered =1)
    public List<Order> getReceipts(Account a) {
        String query = "select c.[uid], c.[oid], o.[pid], o.[amount], c.[ordered]"
                     + "FROM Wish.dbo.[Order] o INNER JOIN Wish.dbo.[Cart] c "
                     + "ON o.oId = c.oId "
                     + "WHERE c.[uid] = ? and c.[ordered] = 1;";
        try {
            Connection conn = new DBContext().getConnection();//mo ket noi voi sql
            PreparedStatement ps = conn.prepareStatement(query);
            System.out.println("DEBUG:" + a);
            ps.setInt(1, a.getId());
            ResultSet rs = ps.executeQuery();
            
            List<Order> result = new ArrayList<>();
            
            while (rs.next()) {
                int oid = rs.getInt(2);
                int amount = rs.getInt(4);
                Order order = new Order();
                order.setOid(oid);
                
                Product p = this.getProductByID(String.valueOf(rs.getInt(3)));
                
                if (p == null) {
                    continue;
                }
                order.setProduct(p);
                order.setAmount(amount);
                order.setOrderStatus(rs.getInt(5));
                
                result.add(order);
            }
            
            System.out.println(result.size());
            
            if (result.isEmpty()) {
                return null;
            }
            
            return result;
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    //
    public void purchase(Account a) {
        Cart c = this.getCart(a);
        
        if (c == null || c.getOrders().isEmpty()) {
            return;
        } 
        
        for (Order o : c.getOrders()) {
            this.purchaseOrder(o.getOid());
        }
        
    }
    
    public void purchaseOrder(int oid) {
        String q = "update [Cart] set [ordered]=1 where [Cart].[oid] = " + oid + ";";
        try {
            Connection conn = new DBContext().getConnection();//mo ket noi voi sql
            PreparedStatement ps = conn.prepareStatement(q);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
   

    
    
    
    
    
    ///  
    public List<Order> getAllOrders() {
        List<Order> result = new ArrayList<>();
        List<Account> acc = this.getSellAccount();
        
        for (Account a : acc) {
            Cart c = this.getCart(a);
            if (c != null) {
                result.addAll(c.getOrders());
            }
        }
        
        return result;
    }
      
     public static void main(String[] args) {
        DAO dao = new DAO();    
        Account a = dao.login("Adam", "123456");
        System.out.println(a.getId());
        Cart c = dao.getCart(a);
        for (Order o : c.getOrders()) {
            if (o == null) {
                System.out.println("Null conmenoroi");
            } else {
                System.out.println(o);
                System.out.println(o.getProduct() == null);
                System.out.println(o.getOid());
                System.out.println(o.getAmount());
            }
        }
    }
}
