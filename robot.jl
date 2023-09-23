function mean_temperature!(robot)
  side = ost 
  N, sum_tmp = temperatures_row!(robot, side) # NS = remperatures_row!(robot, side)
  while !isborder(robot, Nord)
    move!(robot, Nord)
    n, s = temperatures_row!(robot, side) # NS += temperatures_row!(robot, side)
    side = islnverse(side)
    N += n #
    sum_tmp += s #
  end

  return sum_tmp / N
end

function temperatures_row!(robot, side)
  if ismarker!(robot)
    n, s = 1
  else 
    n, s = 0, 0
  end
  while !isborder(robot, side)
    move!(robot, side)
    if ismarker(robot)
      n += 1
      s += temperature(robot)
    end
  end

  return n, s
end







  
