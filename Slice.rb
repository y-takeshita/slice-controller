# -*- coding: utf-8 -*-
require 'topology'
#
class Slice
  def initialize
    @slice = {}
  end

  def input
    c = STDIN.gets
    until c.chomp == 'exit'
      command = c.split(' ')
      parser command
      c = STDIN.gets
    end
  end

  def parser(command)
    case command[0]
    when 'create'
      create command[1]
    when 'add-mac'
      add_mac command[1], command[2]
    when 'del-mac'
      del_mac command[1], command[2]
    when 'delete'
      delete command[1]
    when 'list'
      show_list command[1]
    else
    end
  end

  def same_slice(addr1, addr2)
    @slice.each_key do |key|
      if @slice[key].include?(addr1.to_s) && @slice[key].include?(addr2.to_s)
        return true
      end
    end
    return false
  end

  def dif_slice(addr1, addr2)
    @slice.each_key do |key|
      if @slice[key].include?(addr1.to_s) && @slice[key].include?(addr2.to_s)
        return false
      end
    end
    return true
  end

  private

  def create(s_name)
    @slice[s_name.to_s] = []
  end

  def add_mac(s_name, addr)
    @slice[s_name.to_s].push(addr.to_s)
  end

  def del_mac(s_name, addr)
    @slice[s_name.to_s].delete(addr.to_s)
  end

  def delete(s_name)
    @slice.delete(s_name.to_s)
  end

  def show_list(s_name)
    puts @slice[s_name.to_s]
  end
end
