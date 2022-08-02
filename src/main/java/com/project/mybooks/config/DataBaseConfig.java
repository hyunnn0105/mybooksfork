package com.project.mybooks.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

@Configuration
@ComponentScan(basePackages = "com.project.mybooks")
public class DataBaseConfig {
    @Bean
    public DataSource dataSource(){
        HikariConfig config = new HikariConfig();
        config.setUsername("spring4");
        config.setPassword("1234");

        config.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:xe");
        config.setDriverClassName("oracle.jdbc.driver.OracleDriver");
//        config.setDriverClassName("oracle.jdbc.OracleDriver");

        return new HikariDataSource(config);
    }
}
