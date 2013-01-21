require(mosaic)
require(manipulate)
require(ggplot2)
require(gcookbook)
# Scatter plots
scatterString <- function(s){
  res <- paste("ggplot(data=",s$dat,")",sep="")
    res<-paste(res,"+geom_point(aes(x=",s$x,",y=",s$y,"))",sep="")
  if (!is.na(s$color))
    res<-paste(res, "+aes(colour=",s$color,")",sep="")
  if (!is.na(s$size))
    res<-paste(res,"+aes(size=",s$size,")",sep="")
  if (s$logx)
    res <- paste(res,"+scale_x_log10()",sep="")
  if (s$logy)
    res <- paste(res,"+scale_y_log10()",sep="")
  cat(res)
  if (!is.na(s$facet))
    # res<-paste(res,"+facet_wrap(",facet,")",sep="")
  cat(res)
  return(res)
}

# Bar Plots
barString <- function(s){
  xStr <- s$x
  if( !is.na(s$orderx))
    xStr <- paste("reorder(",s$x,",",s$orderx,")",sep="")
  fillStr <- if( is.na(s$fill) ) ")" else paste(",fill=",s$fill,")",sep="")
  orderStr <- if( is.na(s$ordery) | is.na(s$fill) ) " " else 
    paste(",order=reorder(",s$fill,",",s$ordery,")",sep="")
  aesStr <- paste("aes(x=",xStr,",y=",s$y, orderStr,fillStr,sep="")
  res <- paste("ggplot(data=",s$dat,",",aesStr,")",sep="")
  res<-paste(res,"+geom_bar(stat='identity',position=",s$position,"(width=.9))", sep="")
  if( !is.na(s$colors)) 
    res <- paste(res,"+scale_fill_brewer(type='",s$colors,"',palette=",s$palette,")",sep="")
  return(res)
}

doBar <- function(show=FALSE,dname,...){
  vals <- list(dat=dname,...)
  s <- barString(vals)
  if (show) cat(paste(s,"\n"))
  p <- eval(parse(text=s))
  print(p)
  return(p)
}
mBar <- function(dat) {
  df = substitute(dat)
  nm = names(dat)
  type = nm
  for (k in 1:length(dat)) type[k] <- class(dat[[k]])
  numberNames <- c(list(NONE=NA),
                   v2list(nm[type %in% c("integer","numeric")]))
  factorNames <- c(list(NONE=NA),
                   v2list(nm[type %in% c("factor","character","logical")]))
  vnames <- v2list(nm)
  cnames <- snames <- c(list(NONE=NA),vnames)
  alignNames <- list(dodge="position_dodge",stack="position_stack",
                     proportion="position_fill")
  fillColorNames <- list( default=NA, seq="seq",div="div",qual="qual")
  paletteNames <- list(default=1,two=2,three=3,four=4,five=5,six=6,seven=7,eight=8)
  manipulate({p<-doBar(show,df,x=x,y=y,position=position,
                       fill=fill,ordery=ordery,orderx=orderx,colors=colors,palette=palette)},
             show = button("Show Expression"),
             x = picker(factorNames,initial=factorNames[[2]],label="x axis"),
             y = picker(numberNames,initial=numberNames[[2]],label="y axis"),
             fill = picker(factorNames, initial="NONE",label="Bar Fill"),
             position = picker(alignNames, initial="stack",label="Alignment"),
             ordery=picker(numberNames, initial="NONE",label="Fill Order"),
             orderx=picker(numberNames, initial="NONE",label="X Order"),
             colors=picker(fillColorNames, initial="default",label="Color Scheme"),
             palette=picker(paletteNames, initial="default",label="Palette")
             )
}

# Utilities
#
# Converting a vector of names into a list.
v2list <- function(nms) {
  res = list()
  res[nms] <- nms
  return(res)
}


doScatter <- function(show=FALSE,dname,x=NA,y=NA,color=NA,size=NA,facet=NA,logx=FALSE,logy=FALSE){
  vals <- list(dat=dname,x=x,y=y,color=color,size=size,facet=facet,logx=logx,logy=logy)
  s <- scatterString(vals)
  if (show) cat(paste(s,"\n"))
  p <- eval(parse(text=s))
  print(p)
  return(p)
}
# The user interface
mScatter <- function(dat) {
  df = substitute(dat)
  nm = names(dat)
  vnames <- v2list(nm)
  cnames <- snames <- c(list(none=NA),vnames)
  manipulate({p<-dogg(show,df,x=x,y=y,color=color,size=size,facet=facet,logx=logx,logy=logy)},
             show = button("Show Expression"),
             x = picker(vnames,initial=nm[1],label="x axis"),
             y = picker(vnames,initial=nm[2],label="y axis"),
             color = picker(cnames, initial="none",label="Color"),
             size = picker(snames, initial="none",label="Size"),
             facet = picker(snames, initial="none", label="Facet"),
             logx = checkbox(label="Log X-axis"),
             logy = checkbox(label="Log Y-axis")
             )
}
