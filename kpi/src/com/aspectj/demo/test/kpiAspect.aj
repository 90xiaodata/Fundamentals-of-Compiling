package com.aspectj.demo.test;

import org.apache.commons.lang.time.StopWatch;

public aspect kpiAspect {

	//int map_cnt = 0;
	//int reduce_cnt = 0;
	
	StopWatch clock = new StopWatch();
	pointcut MeanPointCut() : execution(* info.xiaohei.www.mr.kpi.Kpi.main(..));
	
    before() : MeanPointCut(){  
    	clock.start(); //计时开始
    }
    after() : MeanPointCut(){  
    	clock.stop(); //计时结束
    	System.out.println(clock.getTime()+"ms");
    	//System.out.println("The data set is divided into " + map_cnt + " <key,value> pair by mapper.");
    	//System.out.println("The final result is produced by " + reduce_cnt + " reducer.");
    }
    
//    pointcut MapPointCut() : execution(* info.xiaohei.www.mr.kpi.SortMapper.SortMapper.map(..));
//    
//    after() : MapPointCut(){  
//    	map_cnt++;
//    }
    
//    pointcut ReducePointCut() : execution(* info.xiaohei.www.mr.kpi.SortReducer.SortReducer.reduce(..));
//    
//    after() : ReducePointCut(){  
//    	reduce_cnt++;
//    }
}
