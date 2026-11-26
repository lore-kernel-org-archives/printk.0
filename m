Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689379;
	b=Rzv+tyM41vjDo3ZZV8sv3IhwjTIdU3FZGsASL4U0UiUq2dpz/fK1S0Rl7yXLF/UY5Xba
	 Wj+XfjLYvpHIOsT705/2VZb+i/G3+4SHlHznxfM8zgrpVPzPYbi1/JpnzNBi5iJ3qvfWl
	 Xsf47HGR9zYqQ1YADz++XTKq4GK8sCMnX49cpvM98YJpC+zWn7M9z7iZK5kBVhVj5vqkh
	 NWIsj57aW0pNKcwrAlcC+6cI4Uz1zt0Ju9rtdtQ/uTMtlJMzShjo6chBYKbdsG0eZsFyU
	 LUEwVJJ6vZ6xVadPCeSDNu7bqBFYj8cmKtuCHnO9DtoalaZMfppFl8S9L6XyX6rRO5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689379;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=Jw+M1WRUyiknpCKAJoMVGDk38c3faU3rcCZRwbIRH8o=;
	b=oIvasm8rn0J1+CLNOwJRqSTwavF+UuHKDL73Vi6aW7kwVtqfoE/gPnQcDgtp9lf5Pm5k
	 mrKhThadChfpHJQsgkhfawWl3YSV9ZCaxV8mOmLWpIJJlEE/AsQupr6+gl8qsrO0Rvbqz
	 3LX6dFoFwWpPfMCU17zr7GfOenjwOhzwTaO52r7ZQHSsZJOQ6Fq5Td4EPRHtrOFhSqsSl
	 OpzEREJQi3v3lX5oRSDj3biBaz0Ha0Vxw5ufTG9kMMQi6pGqQ12cvZ+77uaij3ybpUNkS
	 ITePpcq21RlgQzVqtJzI7EL+KQOO5VH7i9hEgftzzM0lCzdCte+lP09Ll/q2uvX8LRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Ep4xBEZf;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=orq3f8fr;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4C8606A327
	for <printk@lists.linux.dev>; Thu, 26 Nov 2026 10:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC4C8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Ep4xBEZf;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=orq3f8fr
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795689377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jw+M1WRUyiknpCKAJoMVGDk38c3faU3rcCZRwbIRH8o=;
	b=Ep4xBEZfE2lLSui8heffp4kdNyg9qnkHjJIc5Z0YFhGminsKa1BZlZGah3iPGy6zpnC1Z3
	9akFZbQtH9fhuy32RWH7CB9yM3qzhO+a/hP3OupiQBoq4yvU1K8bLYbjeb+o7nDStBbivB
	AsOarDiGeJD8rubgVMmq/JAA/VqkEvLzEJ08zolXYwh5r2jwz65pd+NBrYlCH5aGXaWVbr
	9B/SMSSKbl29ABKe6P6ejv+nJ3nyG5LWtLfHEO6qRLVavgrmmWW7ev8Py4n7UCLar/JSUf
	9zAQZ95qwvjv+MO8pP0v8JVRIPI6RHCNxxmHoIMNxX4wOblN/RvknW0PfBTKwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795689377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jw+M1WRUyiknpCKAJoMVGDk38c3faU3rcCZRwbIRH8o=;
	b=orq3f8frHv3lJP1UXZb4Vnpv0pV1N0t4MYsp+g22wnYIvL21/kE3PMocuMMJbgmoscjvHV
	lQrr859RDvdKUDDw==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Ryan Roberts <ryan.roberts@arm.com>, Breno Leitao
 <leitao@debian.org>, printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH printk v4 5/8] printk: nbcon: Expand unsafe takeover
 check for general unsafe
In-Reply-To: <awa28PGg8L4rEDha@pathway.suse.cz>
References: <20261121163557.963029-1-john.ogness@linutronix.de>
 <20261121163557.963029-6-john.ogness@linutronix.de>
 <awa28PGg8L4rEDha@pathway.suse.cz>
Date: Thu, 26 Nov 2026 11:42:16 +0106
Message-ID: <87h5h37ucf.fsf@jogness.linutronix.de>
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 2026-11-25, Petr Mladek <pmladek@suse.com> wrote:
> I suggest to rename
> nbcon_allow_unsafe_takeover() to nbcon_check_unsafe() and pass
> *allow_unsafe_takeover as a parameter.

OK. This has the benefit that we could later introduce a per-console
policy to forbid hostile takeovers.

John
