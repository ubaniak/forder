class GroupMember < ActiveRecord::Base
    belongs_to :group
    belongs_to :user


    def self.get_gm(g_id, u_id)
        self.where("group_id = ? and user_id = ?", g_id, u_id)
    end

    def self.invited?(g_id, u_id)
        return !self.get_gm(g_id, u_id).empty?
    end

    def self.confirm_invite(g_id, u_id)
        results = self.where("group_id = ? and user_id = ?", g_id, u_id)
        if not results

        else
            results[0].confirmed = true
            results[0].save
        end
    end

    def self.reject_invite(g_id, u_id)
        results = self.where("group_id = ? and user_id = ?", g_id, u_id)
        if not results

        else
            results[0].destroy
        end
    end
end
