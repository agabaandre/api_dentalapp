<?php


class Employee extends CI_Model
{
    public function get_doctor(){
        $this->db->where ('flag',1);
        $query=$this->db->get('doctors');
        if ($query){
        return $query->result();
        }
        else{
        return array();
        }
    }
    public function get_availabledoctors($date){
       
        $query=$this->db->query("SELECT doctors.id,doctors.name,doctors.job FROM doctors, schedules where doctors.id=schedules.doctor_id and schedules.date like'$date' ");
        if ($query){
        return $query->result();
        }
        else{
        return array();
        }
    }
    public function get_services(){
        $query=$this->db->get('services');
        if ($query){
        return $query->result();
        }
        else{
        return array();
        }
    }

   }
