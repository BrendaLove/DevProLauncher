--相乗り
function c1372887.initial_effect(c)
	--draw
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(1372887,0))
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetCost(c1372887.cost)
	e1:SetOperation(c1372887.operation)
	c:RegisterEffect(e1)
end
function c1372887.cost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.GetFlagEffect(tp,1372887)==0 end
	Duel.RegisterFlagEffect(tp,1372887,RESET_PHASE+PHASE_END,EFFECT_FLAG_OATH,1)
end
function c1372887.operation(e,tp,eg,ep,ev,re,r,rp)
	local e1=Effect.CreateEffect(e:GetHandler())
	e1:SetType(EFFECT_TYPE_CONTINUOUS+EFFECT_TYPE_FIELD)
	e1:SetProperty(EFFECT_FLAG_DELAY)
	e1:SetCode(EVENT_TO_HAND)
	e1:SetCondition(c1372887.drcon)
	e1:SetOperation(c1372887.drop)
	e1:SetReset(RESET_PHASE+PHASE_END)
	Duel.RegisterEffect(e1,tp)
end
function c1372887.filter(c,tp)
	return c:IsControler(1-tp) and c:IsPreviousLocation(LOCATION_DECK) and not c:IsReason(REASON_DRAW)
end
function c1372887.drcon(e,tp,eg,ep,ev,re,r,rp)
	return eg:IsExists(c1372887.filter,1,nil,tp)
end
function c1372887.drop(e,tp,eg,ep,ev,re,r,rp)
		Duel.Draw(tp,1,REASON_EFFECT)
end