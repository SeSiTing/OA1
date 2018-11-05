package com.web;

import com.bean.Car;
import com.bean.CarReserve;
import com.github.pagehelper.PageInfo;
import com.service.CarReserveService;
import com.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

@Controller
public class CarController {
    @Autowired
    private CarService carService;
    @Autowired
    private CarReserveService carReserveService;

    @RequestMapping(value = "/car/string/{m1}", method = RequestMethod.GET)
    public String get(@PathVariable String m1, ModelMap map, Car car,int [] single,
                      @RequestParam(value = "pageindex", defaultValue = "1") int pageindex,
                      @RequestParam(value = "pagesize", defaultValue = "3") int pagesize) {
        if ("show_all".equals(m1)) {//展示所有车辆
            PageInfo<Car> pageInfo = carService.servletAll(pageindex, pagesize);
            map.put("pi", pageInfo);
            return "resource/xingzheng/demo2/list";
        } else if ("show_one".equals(m1)) {//展示单个车辆——进入修改页面
            map.put("car", car);
            return "resource/xingzheng/demo2/edit";
        } else if ("excel_more".equals(m1)) {
            System.out.println(Arrays.toString(single));
            return "redirect:/car/string/show_all";
        } else if ("del_more".equals(m1)){
            System.out.println("----"+Arrays.toString(single));
            return "redirect:/car/string/show_all";
        }
        return null;
    }





    @RequestMapping(value = "/car/void/{m1}", method = RequestMethod.GET)
    public void get(@PathVariable String m1, Car car, CarReserve carReserve,
                    HttpServletResponse response, String newcarid) {
        response.setContentType("text/html;charset=utf-8");
        if ("onlyone".equals(m1)) {//判断车牌号是否重复
            try {
                PrintWriter out = response.getWriter();
                if (car.getCarid().equals(newcarid)) {
                    out.print(true);
                } else {
                    Car c = carService.servletByCarid(newcarid);
                    if (c == null) {
                        out.print(true);
                    } else {
                        out.print(false);
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else if ("checkcar".equals(m1)) {//判断车库里是否有该车牌
            try {
                PrintWriter out = response.getWriter();
                Car c = carService.servletByCarid(car.getCarid());
                if (c == null) {
                    out.print(false);
                } else {
                    out.print(true);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else if ("checktime".equals(m1)) {//根据时间和车牌判断是否被预约
            try {
                long sti = carReserve.getStarttime().getTime();
                long eti = carReserve.getEndtime().getTime();
                Boolean flag = true;
                PrintWriter out = response.getWriter();
                List<CarReserve> clist = carReserveService.servlettimebycarid(carReserve.getCarid());
                for (CarReserve c : clist) {
                    if (c.getStarttime().getTime() < sti &&
                            c.getEndtime().getTime() > sti) {
                        flag = false;
                    }
                    if (c.getStarttime().getTime() < eti &&
                            c.getEndtime().getTime() > eti) {
                        flag = false;
                    }
                    if (c.getStarttime().getTime() >= sti &&
                            c.getEndtime().getTime() <= eti) {
                        flag = false;
                    }
                }

                out.print(flag);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }






    @RequestMapping(value = "/car/string/{m1}", method = RequestMethod.POST)
    public String post(@PathVariable String m1, ModelMap map, Car car) {
        if ("add_car".equals(m1)) {//新增车辆
            carService.insertSelective(car);
            return "redirect:/car/string/show_all";
        }
        return null;
    }

    @RequestMapping(value = "/car/string/{m1}", method = RequestMethod.PUT)
    public String edit(@PathVariable String m1, ModelMap map, Car car) {
        if ("edit_car".equals(m1)) {//编辑车辆
            carService.updateByPrimaryKeySelective(car);
            return "redirect:/car/string/show_all";
        }
        return null;
    }


    @RequestMapping(value = "/car/void/{m1}", method = RequestMethod.DELETE)
    public void del(@PathVariable String m1, ModelMap map, Car car,
                    HttpServletResponse response) {
        response.setContentType("text/html;charset=utf-8");
        if ("del_car".equals(m1)) {//删除车辆
            int k = carService.deleteByPrimaryKey(car.getId());
            try {
                PrintWriter out = response.getWriter();
                if (k > 0) {
                    out.print(true);
                } else {
                    out.print(false);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else if ("del_all".equals(m1)) {
            try {
                PrintWriter out = response.getWriter();
                System.out.println("1111");
                out.print(true);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
