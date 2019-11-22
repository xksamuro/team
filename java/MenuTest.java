import com.onlineShop.dao.MenuDaoMapper;
import com.onlineShop.entity.Action;
import com.onlineShop.entity.Menu;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class MenuTest {
    private static ApplicationContext applicationContext;

    static{
        try {
            applicationContext = new ClassPathXmlApplicationContext("com/onlineShop/applicationContext.xml");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Test
    public void testMenuMapper(){
        SqlSession session = (SqlSession) applicationContext.getBean("sqlSession");
        MenuDaoMapper mapper = session.getMapper(MenuDaoMapper.class);
        List<Menu> menus = mapper.selectMenuByUserId(1);
        for(Menu menu :menus){
            System.out.println(menu);
    }
        List<Action> actions = mapper.selectActionByMenuId(45);
        System.out.println(actions);

    }
}