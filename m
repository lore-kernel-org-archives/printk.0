Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524683;
	b=Lf54T01kMJ8SiU7d7FJu042g1CYMAmZRB5pQvPCIAi9TCCdrB6L9M0fbU/B0x7YvYhe+
	 XuJuUiQs9S5mjbOkCA1fJ2UN66HTiDu6z6GhoSw7nxxXl1/r4VZjrOxhvysUiBYyHKCig
	 p4PKzEKLVwzDLbknbzsNnR/8xpJKhLjeytBAuGB7FM0VbTCWN9/g7Us0gbfLyp+GNd/3D
	 H5HqcGVk+4k9gtn+CLcqjpR44OfpQz6JRlEuOIRk2/54kX46WYdcVVzP6IwGPH5y17N2t
	 uimMbrambxIJfycgshBT+HyhdYA82bzQzNxSdZDggeHzIf9hnX7/jvu0k4+sUaAxiTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
	b=JDS4h1HtilMY9izp/t+sf6X6cdG5UXqdOCJZDOdZHqZqGbVPPbqwLWiRi9/yoOo4UyGR
	 swnII+ZXQ4uiNBUB9aRuM9V6ZXSTsbNFuXRKrinnUmfRc+ZELfVvyPVmd2EQlHcNjymH9
	 XHpH1ai27Ib1URq+/h1lbRWTzQ4wuHXJR+WC4HRnQPQUaTrTVijFMbKvKrCEy5pYfbjqU
	 3qAjr1iKRu4RLs3lRBaqadsB5nolaGBkolgCctqvWiCvOSvFse9oWRQRD54/FVItJl9xv
	 wTtf12hBlGseC0FaPCwRexVDApVHYa54YU0z+ZKb4Clr7jQNtFu6xYkrCULD1cNJUlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=mu6Y5oQa;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0CE606A330
	for <printk@lists.linux.dev>; Thu, 12 Nov 2026 23:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A0CE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=mu6Y5oQa
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so1758785e9.2
        for <printk@lists.linux.dev>; Thu, 12 Nov 2026 15:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794524681; x=1795129481; darn=lists.linux.dev;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
        b=mu6Y5oQaERWBD4Sa2YNgNu98dolNaKGZf8pUD2MmN5F44RdF0UHRd1qPWS9NpKMgN3
         +EDzrJTW1qb/xhSk8D9lWBTbor8Mmfi55EXu7SvPWAaH0EwUqbmexgTdgof70yNyoFMD
         ks0R9Fxc/jEtKtSGGBrLoIZoBFdsTCCOXAIlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524681; x=1795129481;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
        b=ZiO4YjxJMnCa+gxyeBeeCVe5OxkA0NG+7YXOqrAObcslO+j5MGUXKdWUj1gWlkoD8C
         DHun6Bcg+7rJuWLKooxC3rg/w9RjoqCGe/jZ3dPRfIsQc7g+4YSOKy+eA2fAscgsUZIA
         VJom1Rj1mlAg3dPofC4kXt+UaB0kRSFwihUL9hSBcywBeXuRlSQxKm3E24DNOMUXyZ6W
         es6jyNMActK9wciKw8j2tpOxm6eeTMr/CTVqzisXi4q4M5pHVtSBLFoR1WvQqH0AziLS
         t+g01mB31bADrtSoHcRrLqR9Ycl77hEyCECpc84Ynz/R/Jlgio031NMtb+FVNpVkcYR6
         zJHg==
X-Forwarded-Encrypted: i=1; AL+hErHNVRP/WZnaNdThhOyOQJbMQ1E0nCQLBIZktfHPrY9vir4+ddkFEL1PAVjZzgfLv9URF6X17+w=@lists.linux.dev
X-Gm-Message-State: APuU4Z8+a6/jztlUsOLL5KRwX8cFO3EFP8NrC6c8Kc1CLFGvSP/NUnlp
	N2w9Zt01CbOJ7ZWp3cX2D8Pb1CArIXutY7P2mrZ11vA84PRGTplEsBpMyvchijmj73xsnsVf4hX
	/rcWum+QJaJU5f88=
X-Gm-Gg: AYBFou2GHpXpQY3W8UL6fjq/gDToyYnBzq5b3hfrnPOBUMeH52UvrVmuX1v6gJD21U7
	PjBfYUupbLtyxwhJvJqeg6QZ3OA9bDpqvggn9DJfy/AhFUaJv5+FrL1uL2l62W0Qz9s5pxN6R5Z
	zW4C18zdC7rYWvL4jituyWquW0/C5mVArAUr4Fc2jqLYePiOCjsiskmei3Wiv/AH/r9OhopjZ5a
	H8cwyqqs7bowly4vdJSbVwhbSbt0EPzginXLHdpcRrj/aFs3zuTc53EE5RE+t1QGgchgZdO3BWQ
	cWThBxjDKo99+Vj+kg7xQhhlcYHrKnQsJFPGO07PPsd/G6agTlwKpB3PJNbCw7MXtYIy51qOaAo
	HElmkY4cMYVmDhYJXfmNpdb1ybMk9CVN0Qkaz1u9BcGZKueyrlUt/caiBNqmXKL2dg6ikX9vqY9
	JcLVnGawrPC/OnQLMSGePsWpzN7cxcgVmXKrRLucxfFtdTyPr4tEVcczkOmgdQUrwJXHoI/51a+
	/Pq/dSk0Npb6pbBmERGwBnl7YI1JU1BOmilRPFYK+LIvWJ89xBHWm8B8k5YneT9TrH5xRxEGYnf
	z1ltA5sl1fraQ4qGRUCsY6EO+sSrsLm/8yOen0YI2qj8QT6hR8Uum34+aH4XOnxXjVeL+AgUsgO
	qCqumhHg72vGqcK4YimVcgQ9QNdSm/z0aFqC4Sjngcs/IU25VbBgT9nybAKd3AnF6rNUvsTzapl
	Qwdam0dbGWkCc/fZAxy78ATwmZZNmheEdyDJJaU6SwNNBq7qFpREMFeXoAyQ==
X-Received: by 2002:a05:600c:c84:b0:4a1:e57b:667c with SMTP id 5b1f17b1804b1-4bb55a68429mr14978415e9.26.1794524680651;
        Thu, 12 Nov 2026 15:04:40 -0800 (PST)
Received: from [172.18.0.2] ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm2213849f8f.44.2026.11.12.15.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 15:04:40 -0800 (PST)
Date: Thu, 12 Nov 2026 15:04:35 -0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Marcos Paulo de Souza <mpdesouza@suse.com>, Naveen Kumar Chaudhary <naveen.osdev@gmail.com>, printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 06/17] printk: Prefer the console either via name or devname exclusively
In-Reply-To: <20261111154816.71103-7-pmladek@suse.com>
References: <20261111154816.71103-1-pmladek@suse.com> <20261111154816.71103-7-pmladek@suse.com>
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261112150435.fede0e5e012fb9c6@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Reviewed-by: Chris Down <chris@chrisdown.name>
