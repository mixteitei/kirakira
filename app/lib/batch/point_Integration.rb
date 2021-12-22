class Batch::PointIntegration
  def self.point_integration
    users = User.all
    users.each do |user|
      points_of_4manthago = user.points.where(created_at: date.today.ago(4.month))
      totalpoints = points_of_4manthago.map{|p| p.point}.sum
      user.totalpoint.point += totalpoints
      if totalpoint.save
        points_of_4manthago.delete_all
      end
    end
  end
end