package cn.bdqn.Controller;


import cn.bdqn.domain.ItemTypes;
import cn.bdqn.domain.PeItems;
import cn.bdqn.execption.MyException;
import cn.bdqn.service.ItemTypesService;
import cn.bdqn.service.PeItemsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/physical/")
public class PhysicalController {

    @Autowired
    private ItemTypesService itemTypesService;
    @Autowired
    private PeItemsService peItemsService;


    /**
     * 查询全部和分页
     * @param typeId
     * @param page
     * @param modelMap
     * @return
     */
    @RequestMapping("/query")
    public String select(Integer typeId,String page, ModelMap modelMap) throws Exception{

        try{
            //判断当前页是否为空
            if (page==null){
                page = "1";
            }
            //开启分页
            PageHelper.startPage(Integer.parseInt(page),2);
            //把查到的数据放到分页插件中
            PageInfo<PeItems> peItems = new PageInfo<>(peItemsService.queryByTypeId(typeId));
            //查询全部类型
            List<ItemTypes> itemTypes = itemTypesService.queryAll();
            //设置作用域
            modelMap.addAttribute("itemTypes",itemTypes);//把分页后的数据放到request作用域中
            modelMap.addAttribute("peItems",peItems);//把全部类型放到request作用域中
            modelMap.addAttribute("typeId",typeId);//把查询的id放到request作用域中
            return "physical";//返回逻辑页面
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("出错了!");
        }
    }

    /**
     * 打开更新页面
     * @param intemId
     * @param modelMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/addUpdateUl")
    public String AddUpdateUl(String intemId,ModelMap modelMap)throws Exception{
        try {
            //查询单个用户
            PeItems peItems =  peItemsService.queryByIntemId(Integer.parseInt(intemId));
            List<ItemTypes> itemTypesList = itemTypesService.queryAll();
            modelMap.addAttribute("peItem",peItems);
            modelMap.addAttribute("itemTypesList",itemTypesList);
            return "update";
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("出错了!");
        }
    }

    /**
     * 更新方法
     * @param peItems
     * @return
     * @throws Exception
     */
    @RequestMapping("/update")
    public String update(PeItems peItems)throws Exception{

        try {
            if(peItems.getNecessary()==null){
                peItems.setNecessary(2);
            }
            peItemsService.updateByPeItems(peItems);
            return "forward:/physical//query";
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("出错了");
        }
    }

    /**
     * 打开添加页面
     * @param modelMap
     * @return
     */
    @RequestMapping("/addSaveUl")
    public String addSaveUl(ModelMap modelMap)throws Exception{
        try{
            List<ItemTypes> itemTypes = itemTypesService.queryAll();
            modelMap.addAttribute("items",itemTypes);
            return "save";
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("出错了");
        }
    }


    /**
     * 添加操作
     * @param peItems
     * @return
     */
    @RequestMapping("/save")
    public String save(PeItems peItems)throws Exception{
        try {
            if(peItems.getNecessary()==null){
                peItems.setNecessary(2);
            }
            //调用添加的方法
            peItemsService.save(peItems);
            //转发
            return "forward:/physical//query";
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("出错了");
        }
    }

    /**
     * 删除
     * @param intemId
     * @return
     */
    @RequestMapping("/delete")
    public String delete(Integer intemId)throws Exception{
        try {
            //调用删除的方法
            peItemsService.deleteByIntemId(intemId);
            //转发
            return "forward:/physical//query";
        }catch (Exception e){
            e.printStackTrace();
            //new 一个自定义异常
            throw new MyException("出错了" );
        }
    }
}
